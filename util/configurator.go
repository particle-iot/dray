package util

import (
	"reflect"
	"sync"

	"github.com/kelseyhightower/envconfig"
	log "github.com/Sirupsen/logrus"
)

type ConfigSpecification struct {
	DockerHost   string `envconfig:"DOCKER_HOST" default:"unix:///var/run/docker.sock"`
	LogLevel     string `envconfig:"LOG_LEVEL" default:"info"`
	RedisPort    string `envconfig:"REDIS_PORT"`
	JobsKey      string `default:"jobs"`
}

type configurator struct {
	config ConfigSpecification
}

var instance *configurator
var once sync.Once

func GetConfig() ConfigSpecification {
	once.Do(func() {
		var c ConfigSpecification
		err := envconfig.Process("dray", &c)
		if err != nil {
			log.Fatal(err.Error())
		}

		instance = &configurator{config: c}
	})
	return instance.config
}

func GetDefaultValue(name string) interface{} {
	c := GetConfig()
	t := reflect.TypeOf(c)
	field, found := t.FieldByName(name)
	if !found {
		return nil
	}
	return field.Tag.Get("default")
}
