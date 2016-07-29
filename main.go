package main // import "github.com/CenturyLinkLabs/dray"

import (
	"flag"
	"net/url"
	"strings"

	"github.com/CenturyLinkLabs/dray/api"
	"github.com/CenturyLinkLabs/dray/job"
	"github.com/CenturyLinkLabs/dray/util"
	log "github.com/Sirupsen/logrus"
)

func init() {

}

func main() {
	log.SetLevel(logLevel())

	port := flag.Int("p", 3000, "port on which the server will run")
	flag.Parse()

	r := job.NewJobRepository(redisHost(), redisAuth())
	e := job.NewExecutor(dockerEndpoint())
	jm := job.NewJobManager(r, e)

	s := api.NewServer(jm)
	s.Start(*port)
}

func redisUrl() *url.URL {
	redisPort := util.GetConfig().RedisPort

	if len(redisPort) == 0 {
		log.Error("Missing required REDIS_PORT environment variable")
	}

	u, err := url.Parse(redisPort)
	if err != nil {
		log.Errorf("Invalid Redis URL: %s", err)
		panic(err)
	}

	return u
}

func redisHost() string {
	u := redisUrl()

	return u.Host
}

func redisAuth() string {
	u := redisUrl()
	p := ""

	if (u.User != nil) {
		p, _ = u.User.Password()
	}
	return p
}

func dockerEndpoint() string {
	endpoint := util.GetConfig().DockerHost

	return endpoint
}

func logLevel() log.Level {
	levelString := util.GetConfig().LogLevel

	level, err := log.ParseLevel(strings.ToLower(levelString))
	if err != nil {
		log.Errorf("Invalid log level: %s", levelString)
		return log.InfoLevel
	}

	return level
}
