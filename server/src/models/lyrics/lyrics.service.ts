import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';

@Injectable()
export class LyricsService {
  private readonly API_KEY = process.env.LYRICS_API_KEY;
  private readonly BASE_URL = process.env.LYRICS_API_URL;

  constructor(private httpService: HttpService) {}

  async searchTrack(trackName: string, artistName: string) {
    const params = {
      apikey: this.API_KEY,
      q_track: trackName,
      q_artist: artistName,
      format: 'json',
      page_size: 1,
    };

    try {
      console.log('serachTrack lyrics')
      const response = await this.httpService.get(`${this.BASE_URL}/track.search`, { params }).toPromise();
      console.log('response', response)
      const trackInfo = response.data.message.body.track_list[0].track;
      return {
        track_id: trackInfo.track_id,
        track_name: trackInfo.track_name,
        artist_name: trackInfo.artist_name,
        track_genre: trackInfo.track_genre ? trackInfo.track_genre : null
      };
    } catch (error) {
      console.error(`Error searchTrack Lyrics ${error}`)
      throw new InternalServerErrorException(`Failed to search track: ${error.message}`);
    }
  }

  async getLyrics(trackId: number) {
    const params = {
      apikey: this.API_KEY,
      track_id: trackId,
      format: 'json',
    };

    try {
      console.log('getLyrics lyrics')

      const response = await this.httpService.get(`${this.BASE_URL}/track.lyrics.get`, { params }).toPromise();
      const lyrics = response.data.message.body.lyrics.lyrics_body;
      return lyrics.substring(0, lyrics.lastIndexOf('...')).trim();
    } catch (error) {
      console.error(`Failed to get lyrics: ${error}`)
      throw new InternalServerErrorException(`Failed to get lyrics: ${error.message}`);
    }
  }
}
