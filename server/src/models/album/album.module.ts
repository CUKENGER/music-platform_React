import { Module } from "@nestjs/common";
import { AlbumController } from "./album.controller";
import { AlbumService } from "./album.service";
import { PrismaService } from "prisma/prisma.service";
import { AlbumFileService } from "./albumFile/albumFile.service";
import { ArtistService } from "models/artist/artist.service";
import { AudioService } from "models/audioService/audioService.service";
import { CommentService } from "models/comment/comment.service";
import { AlbumFileModule } from "./albumFile/albumFile.module";
import { ArtistFileModule } from "models/artist/artistFile/artistFile.module";
import { AlbumHelperService } from "./albumHelper.service";
import { UserService } from "models/user/user.service";
import { RoleService } from "models/role/role.service";
import { JwtService } from "@nestjs/jwt";

@Module({
    imports: [AlbumFileModule, ArtistFileModule],
    controllers: [AlbumController],
    providers: [
        PrismaService, 
        AlbumService,
        AlbumFileService,
        ArtistService, 
        AudioService, 
        CommentService,
        AlbumHelperService,
        UserService,
        RoleService,
        JwtService
    ]
})
export class AlbumModule {}