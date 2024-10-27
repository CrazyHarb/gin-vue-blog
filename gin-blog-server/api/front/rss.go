package front

import (
	"fmt"
	"gin-blog/model/req"
	"gin-blog/utils/r"
	"log"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/feeds"
)

type RSSService struct{}

func (h *RSSService) HandlerRssHandler(c *gin.Context) {
	reqquery := req.GetFrontArts{PageQuery: req.PageQuery{
		PageSize: 1000,
		PageNum:  1,
	},
		CategoryId: 0,
		TagId:      0,
	}

	articleList := articleService.GetFrontList(reqquery)

	now := time.Now()
	feed := &feeds.Feed{
		Title:       "后天有雨 | 二进制技术学习",
		Link:        &feeds.Link{Href: "http://ipoluo.com"},
		Description: "树欲静而风不止",
		Author:      &feeds.Author{Name: "CrazyHarb", Email: "951319124@qq.com"},
		Created:     now,
	}

	for _, articleCurrent := range articleList {
		feed.Items = append(feed.Items, &feeds.Item{
			Title:       articleCurrent.Title,
			Link:        &feeds.Link{Href: fmt.Sprintf("https://www.ipoluo.com/article/%d", articleCurrent.ID)},
			Description: articleCurrent.Desc,
			Author:      &feeds.Author{Name: "画中蝉", Email: "951319124@qq.com"},
			Content:     articleCurrent.Content,
			Created:     articleCurrent.CreatedAt,
		})
	}

	rss, err := feed.ToRss()
	if err != nil {
		log.Fatal(err)
	}

	r.SuccessRawData(c, []byte(rss))
}
