package upload

import (
	"errors"
	"fmt"
	"gin-blog/config"
	"gin-blog/utils"
	"mime/multipart"
	"path"
	"time"

	"github.com/aliyun/aliyun-oss-go-sdk/oss"
)

type Aliyun struct{}

func (*Aliyun) DeleteFile(key string) error {
	return nil
}

func (*Aliyun) UploadFile(file *multipart.FileHeader) (filePath, fileName string, err error) {
	var AliyunAccessKeyId = config.Cfg.Aliyun.AccessKey
	var AliyunAccessKeySecret = config.Cfg.Aliyun.SecretKey
	var AliyunEndpoint = config.Cfg.Aliyun.Endpoint
	var AliyunBucketName = config.Cfg.Aliyun.Bucket
	client, err := oss.New(AliyunEndpoint, AliyunAccessKeyId, AliyunAccessKeySecret)
	if err != nil {
		return "", "", errors.New("[AliyunUpload] ossNew error, err:" + err.Error())
	}

	// 获取存储空间。
	bucket, err := client.Bucket(AliyunBucketName)
	if err != nil {
		return "", "", errors.New("[AliyunUpload] get bucket error, err:" + err.Error())
	}

	fileObj, err := file.Open()
	if err != nil {
		return "", "", errors.New("[AliyunUpload] open file error, err:" + err.Error())
	}

	defer fileObj.Close()

	uploadName := fmt.Sprintf("%d%s%s", time.Now().Unix(), utils.Encryptor.MD5(file.Filename), path.Ext(file.Filename))

	err = bucket.PutObject(uploadName, fileObj)
	if err != nil {
		return "", "", errors.New("[AliyunUpload] put object error, err:" + err.Error())
	}
	//拼接链接,默认使用https
	if config.Cfg.Aliyun.UseHTTPS {
		return fmt.Sprintf("https://%s.%s/%s", config.Cfg.Aliyun.Bucket, config.Cfg.Aliyun.Endpoint, uploadName), uploadName, nil
	} else {
		return fmt.Sprintf("http://%s.%s/%s", config.Cfg.Aliyun.Bucket, config.Cfg.Aliyun.Endpoint, uploadName), uploadName, nil
	}
}
