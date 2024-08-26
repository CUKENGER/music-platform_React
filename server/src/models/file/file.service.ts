import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import * as path from "path";
import * as fs from "fs";
import * as uuid from "uuid"

export enum FileType {
    AUDIO = "audio",
    IMAGE = "image"
}

@Injectable()
export class FileService{

    async createFile(type: FileType, file): Promise<string> {
        try {
            file = Array.isArray(file) ? file[0] : file;
            if (!file || !file.originalname) {
                throw new Error('File or file.originalname is undefined');
            }
            const fileExtension = file.originalname.split('.').pop();
            const fileName = uuid.v4() + '.' + fileExtension;
            console.log('fileName', fileName);
            const filePath = path.resolve(__dirname, '../../', 'static', type);
            console.log('filePath', filePath);
            fs.mkdirSync(filePath, { recursive: true });
            fs.writeFileSync(path.resolve(filePath, fileName), file.buffer);
            return type + '/' + fileName;
        } catch (e) {
            throw new HttpException(e.message, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}