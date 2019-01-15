package main

import (
    "net/http"

    "github.com/gin-contrib/static"
    "github.com/gin-gonic/gin"
)

func main() {
    r := gin.Default()
    r.Use(static.Serve("/", static.LocalFile("/go/static", true)))

    r.GET("/ping", pong)
    r.Run(":8080")
}

func pong(c *gin.Context) {
    c.JSON(http.StatusOK, "pong")
}
