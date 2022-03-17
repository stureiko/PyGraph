import logging
import logging.config
import os
import coloredlogs
import yaml


def setup_logging(default_path='config/logger_config.yaml',
                  default_level=logging.INFO,
                  env_key='LOG_CFG'):
    path = default_path
    value = os.getenv(env_key, None)
    if value:
        path = value
    if os.path.exists(path):
        with open(path, 'rt') as f:
            try:
                config = yaml.safe_load(f.read())
                logging.config.dictConfig(config)
                coloredlogs.install()
            except Exception as e:
                print(e)
                print('Error in Logging Configuration. Using default configs')
                logging.basicConfig(level=default_level)
                coloredlogs.install(level=default_level)
    else:
        logging.basicConfig(level=default_level)
        coloredlogs.install(level=default_level)
        print('Failed to load configuration file. Using default configs')


def setupLogging():
    with open('config/logger_config.yaml', 'rt') as file:
        config = yaml.safe_load(file.read())
        logging.config.dictConfig(config)


if __name__ == "__main__":
    with open('../config/logger_config.yaml', 'rt') as file:
        config = yaml.safe_load(file.read())
        logging.config.dictConfig(config)
    logger = logging.getLogger(__name__)
    logger.info("logger set :D")




