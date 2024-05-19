import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, getConnection } from 'typeorm';
import { Track } from './scheme/track.schema';
import { Comment } from './scheme/comment.schema';
import { CreateTrackDto } from './dto/create-track.dto';
import { CreateCommentDto } from './dto/create-comment.dto';
import { FileService, FileType } from 'src/file/file.service';
import * as fs from 'fs'
import * as path from 'path'
import { Artist } from 'src/artist/scheme/artist.schema';
import { ArtistService } from 'src/artist/artist.service';

@Injectable()
export class TrackService {

	constructor(
		@InjectRepository(Track) 
		private trackRepository: Repository<Track>,
		@InjectRepository(Comment) 
		private commentRepository: Repository<Comment>,
		private fileService: FileService,
		@InjectRepository(Artist)
		private artistRepository: Repository<Artist>,
		private artistService: ArtistService
	) {

	}

	async create(createTrackDto: CreateTrackDto, picture, audio): Promise<string> {

		if (picture && audio) {
			const audioPath = this.fileService.createFile(FileType.AUDIO, audio)
			const imagePath = this.fileService.createFile(FileType.IMAGE, picture)
			console.log('audioPath',audioPath)
			console.log('imagePath',imagePath)
			const newTrack = await this.trackRepository.create(createTrackDto);
			newTrack.listens = 0;
			newTrack.likes = 0
			newTrack.genre = createTrackDto.genre
			newTrack.audio = audioPath
			newTrack.picture = imagePath
			const artistDto = {
				name: newTrack.artist,
				genre: '',
				description: '',
			}
			await this.artistService.create(artistDto, picture)
			await this.trackRepository.save(newTrack);
			return JSON.stringify({ id: newTrack.id, name: newTrack.name });
		} else {
			// throw new Error('нихуя не загрузилось блять')
			console.log('нихуя не загрузилось блять')
		}

	}

	async getAll(count = 10 , offset = 0): Promise<Track[]> {
		const tracks = await this.trackRepository.find({
			skip: offset,
			take: count,
			relations: ['comments', 'album', 'artistEntity']
		});
		return tracks
	}

	async getOne(id: number): Promise<Track> {
		const track = await this.trackRepository.findOne({ where: { id } , relations: ['comments', 'album', 'artistEntity'] });
		return track
	}

	async delete(id: number): Promise<Track> {
		const track = await this.trackRepository.findOne({ where: { id } });
		if (!track) {
			throw new Error(`Track with id ${id} not found`);
		}
		// Удаление связанных файлов
		if (track.picture) {
			try {
				const picturePath = path.resolve('static/', track.picture); // Путь к файлу изображения
				fs.unlinkSync(picturePath); 
			} catch(e) {
				console.log(e)
			}
		} 
		if (track.audio) {
			try{
				const audioPath = path.resolve('static/', track.audio); // Путь к аудиофайлу
				fs.unlinkSync(audioPath);
			} catch(e) {
				console.log(e)
			}
		}

		// Удаление связанных комментариев
		await this.commentRepository.delete({ trackId: id });

		// Удаление трека
		const deleteTrack = await this.trackRepository.delete(id)

		return track;
	}

	async addComment(dto: CreateCommentDto): Promise<Comment> {
		// Создаем комментарий
		const comment = await this.commentRepository.create({...dto});
		await this.commentRepository.save(comment);
	
		// Получаем трек, к которому добавляем комментарий
		const track = await this.trackRepository.findOne({ where: { id: dto.trackId }, relations: ['comments'] });
	
		if (!track) {
			throw new Error(`Track with id ${dto.trackId} not found`);
		}
	
		// Загружаем комментарии для этого трека
		await this.trackRepository.findOne({ where: { id: dto.trackId }, relations: ['comments'] });
	
		// Добавляем идентификатор комментария в массив комментариев трека
		track.comments.push(comment);
	
		// Сохраняем обновленный трек
		await this.trackRepository.save(track);
	
		return comment;
	}

	async listen(id) {
		try {
			const track = await this.trackRepository.findOne({ where: { id: id } });
			if (track) {
				track.listens += 1;
				await this.trackRepository.save(track);
				return track.id; // Возвращаем обновленный объект трека
			} else {
				throw new Error(`Track with id ${id} not found`);
			}
		} catch (e) {
			console.log(e);
			throw e; // Пробрасываем исключение дальше, чтобы его можно было обработать в вызывающем коде
		}
	}

	async searchByName(query: string, count: number, offset: number): Promise<Track[]> {
		const tracks = await this.trackRepository
        .createQueryBuilder('track')
        .where('LOWER(track.name) LIKE LOWER(:name)', { name: `%${query}%` })
		.skip(offset)
		.take(count)
        .getMany();

    	return tracks;
	}

	async addLikes(id) {
		try {
			const track = await this.trackRepository.findOne({ where: { id: id } });
			if (track) {
				track.likes += 1;
				await this.trackRepository.save(track);
				return track.id; // Возвращаем обновленный объект трека
			} else {
				throw new Error(`Track with id ${id} not found`);
			}
		} catch (e) {
			console.log(e);
			throw e; // Пробрасываем исключение дальше, чтобы его можно было обработать в вызывающем коде
		}
	}

}