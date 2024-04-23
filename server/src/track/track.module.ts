import { Module } from '@nestjs/common';
import { TrackController } from './track.controller';
import { TrackService } from './track.service';
import { Track } from './scheme/track.schema';
import { TypeOrmModule } from '@nestjs/typeorm';
import {Comment} from './scheme/comment.schema';
import { FileService } from 'src/file/file.service';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [TypeOrmModule.forFeature([Track, Comment]), ConfigModule],
  controllers: [TrackController],
  providers: [TrackService, FileService],
})
export class TrackModule {}
