local logger = require("logging.logger")
return logger.getLogger("Magicka Expanded") or
           logger.new {name = "Magicka Expanded", logLevel = "INFO"}
