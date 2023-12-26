# Load library
library(phyloseq); packageVersion("phyloseq")

# Set paths for reading and writing data
path.data <- "./data"
path.rds <- "./rds"

# Read in count, taxonomic and experimental information
taxa <- read.csv(file.path(path.data, ""), row.names = 1)
otu <- read.csv(file.path(path.data, ""), row.names = 1)
meta <- read.csv(file.path(path.data, ""), row.names = 1)

# Check sample names are same
all(row.names(meta) == colnames(otu.sort))

# Create phyloseq object
ps <- phyloseq(otu_table(otu.sort, taxa_are_rows = TRUE), tax_table(as.matrix(taxa)), sample_data(meta))
ps

# Write object to disk
saveRDS(ps, file.path(path.rds, "phyloseq.rds"))