import { Album } from "src/album/album.schema";
import { Track } from "src/track/scheme/track.schema";
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { ArtistComment } from "../artistComment/artistComment.schema";

@Entity()
export class Artist {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  genre: string;

  @Column()
  description: string;

  @Column({default: 0, nullable:true})
  listens: number;

  @Column({default: 0, nullable:true})
  likes: number;

  @Column({nullable: true})
  picture: string;

  @OneToMany(() => Track, track => track.artistEntity, {nullable: true})
  tracks: Track[];

  @OneToMany(() => ArtistComment, comment => comment.artist, {nullable: true})
  comments: ArtistComment[];

  @OneToMany(() => Album, album => album.artistEntity, {nullable: true})
  albums: Album[];
}