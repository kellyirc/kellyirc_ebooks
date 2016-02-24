# Builds the model by retrieving the last ~3.2k tweets of our twitters
# Run this before starting `ebooks start`

`rm -r model corpus`
`mkdir model corpus`

KELLYIRC_USERS = ["rahatarmanahmed", "rayyukay", "seiyria", "spookyco", "darkbuizel"]

KELLYIRC_USERS.each do |user|
    `ebooks archive #{user} corpus/#{user}.json`
end

CORPUS_PATHS = KELLYIRC_USERS.map { |user| "corpus/#{user}.json" }

`ebooks consume-all all #{CORPUS_PATHS.join ' '}`
