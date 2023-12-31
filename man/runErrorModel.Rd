% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runErrorModel.R
\name{runErrorModel}
\alias{runErrorModel}
\title{Apply error model to estimate technical SD from raw counts}
\usage{
runErrorModel(counts, platform = "general")
}
\arguments{
\item{counts}{vector or matrix of raw counts}

\item{platform}{String specifying which platform was used to create
"rawCounts". Default to "dsp", for digital spatial profiler/ aka GeoMx.
 Other options include "ncounter", "rsem", "quantile", and "st" for spatial transcriptomics/visium.}
}
\value{
a matrix of log2-scale SDs
}
\description{
Based on raw counts, uses past data to estimate each raw count's log-scale
SD from technical noise.
Specifies different error models for different platforms.
}
\examples{
library(GeomxTools)
datadir <- system.file("extdata", "DSP_NGS_Example_Data", package = "GeomxTools")
demoData <- readRDS(file.path(datadir, "/demoData.rds"))

demoData <- shiftCountsOne(demoData)
target_demoData <- aggregateCounts(demoData)

sd_from_noise <- runErrorModel(counts = exprs(target_demoData), platform = "dsp") 
wts <- 1 / sd_from_noise
}
