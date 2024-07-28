import { MiddlewareConsumer, Module, RequestMethod } from '@nestjs/common';
import { Track } from './track/scheme/track.schema';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TrackModule } from './track/track.module';
import { FileModule } from './file/file.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import * as path from 'path';
import { Album } from './album/album.schema';
import { AlbumModule } from './album/album.module';
import { AlbumComment } from './album/commentAlbum/albumComment.schema';
import { LoggingMiddleware } from './middleware/appMiddleware';
import { APP_INTERCEPTOR } from '@nestjs/core';
import { LoggingInterceptor } from './middleware/appInterceptor';
import { ArtistComment } from './artist/artistComment/artistComment.schema';
import { Artist } from './artist/scheme/artist.schema';
import { ArtistModule } from './artist/artist.module';
import { TrackComment } from './track/scheme/trackComment.schema';
import { TrackReplyComment } from './track/scheme/trackReplyComment.schema';
import { LyricsService } from './lyrics/lyrics.service';
import { HttpModule } from '@nestjs/axios';
import { LyricsController } from './lyrics/lyrics.controller';


@Module({
  imports: [
    HttpModule,
    ServeStaticModule.forRoot({
      rootPath: path.resolve(__dirname, '..','static'),
    }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DATABASE_HOST,
      port: parseInt(process.env.DATABASE_PORT, 10),
      username: process.env.DATABASE_USERNAME,
      password: process.env.DATABASE_PASSWORD,
      database: process.env.DATABASE_NAME,
      entities: [
        Track, 
        Album, 
        AlbumComment,
        Artist, 
        ArtistComment,
        TrackComment,
        TrackReplyComment
      ],
      synchronize: true,
    }),
    TrackModule,
    FileModule,
    AlbumModule,
    ArtistModule
  ],
  controllers: [LyricsController],
  providers: [LyricsService],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(LoggingMiddleware)
      .forRoutes('*'); // Apply middleware to all routes
    // You can also apply middleware to specific routes
  
    // Apply interceptor globally
    providers: [
      {
        provide: APP_INTERCEPTOR,
        useClass: LoggingInterceptor,
      },
    ];
  }
}
