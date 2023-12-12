package service

import (
	"gin-blog/utils/r"
	"gin-blog/utils/upload"
	"log"
	"mime/multipart"
)

type File struct{}

// 文件上传
func (*File) UploadFile(header *multipart.FileHeader) (url string, code int) {
	oss := upload.NewOSS()
	filePath, _, uploadErr := oss.UploadFile(header)
	if uploadErr != nil {
		log.Printf("[upload]error: %s", uploadErr.Error())
		return "", r.ERROR_FILE_UPLOAD
	}
	return filePath, r.OK
}
