#cluster.functions = makeClusterFunctionsInteractive()

cluster.functions = makeClusterFunctionsLSF('/nfs/research2/saezrodriguez/mike-software/LSF.tmpl')
mail.start = "none"
mail.done = "none"
mail.error = "first"
mail.from = "<lsf@ebi.ac.uk>"
mail.to = paste0("<", Sys.info()[["user"]], "@ebi.ac.uk>")
mail.control = list(smtpServer="mx1.ebi.ac.uk")

db.driver = "SQLite"
db.options = list()

#default.chunks.as.arrayjobs = TRUE
#default.max.retries = 3

default.resources = list(
    queue = "research-rh6",
    walltime = "10080",
    memory = "2048"
)

staged.queries = TRUE
#raise.warnings = TRUE
#max.concurrent.jobs = 100
#debug = TRUE

