import { Module } from '@nestjs/common';
import { TrackController } from './track.controller';
import { TrackService } from './track.service';
import { PrismaService } from 'prisma/prisma.service';
import { FileService } from 'models/file/file.service';
import { FileModule } from 'models/file/file.module';
import { AudioService } from 'models/audioService/audioService.service';
import { CommentService } from 'models/comment/comment.service';
import { JwtService } from '@nestjs/jwt';

@Module({
  imports: [FileModule],
  controllers: [TrackController],
  providers: [
    TrackService, 
    PrismaService, 
    FileService,
    AudioService,
    CommentService,
    JwtService
  ],
  exports: [TrackService]
})
export class TrackModule {}
