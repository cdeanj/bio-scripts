# data(enterotype)
# ps <- enterotype
# plot_counts(ps, feature = "Bacillus", stratify.by = "Nationality")
plot_counts <- function(ps, feature, stratify.by) {
  subset_phyloseq <- prune_taxa(feature, ps)
  melted_df <- psmelt(subset_phyloseq)
  p <- ggplot(melted_df, aes(x = .data[[stratify.by]], y = Abundance)) +
    geom_boxplot() +
    theme_bw()
  return(p)
}