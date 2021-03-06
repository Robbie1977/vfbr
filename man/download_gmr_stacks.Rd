% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vfb_stack_downloads.R
\name{download_gmr_stacks}
\alias{download_gmr_stacks}
\title{Download the registered GMR stacks for given ids}
\usage{
download_gmr_stacks(ids, download.dir = getOption("vfbr.stack.downloads"),
  Force = FALSE, ...)
}
\arguments{
\item{ids}{Character vector of GMR ids specified in any way}

\item{download.dir}{The download directory}

\item{Force}{Whether to force the download.}

\item{...}{Additional arguments passed to \code{\link{download.file}}}
}
\value{
Named character vector of paths to downloaded files
}
\description{
Download the registered GMR stacks for given ids
}
\details{
Note that the downloading tries to be a little bit clever, by
  \enumerate{

  \item wrapping the \code{download.file} call in a try expression in case it
  fails

  \item caching the \code{download.file} call so if the destination file
  already exists it will not re-download the file.

  }

  If caching gives you unexpected behaviour, you can set \code{Force=TRUE}.
}
\examples{
\dontrun{
stacks=download_gmr_stacks(c('9A09', '95H11'))
stacks

# on Mac and Windows systems, this will open in the default application
# e.g. Fiji/ImageJ if you have associated ".nrrd" files
open_stack<-function(x) system(paste("open", paste(shQuote(x), collapse = " ")))
open_stack(stacks)

# open the downloads directory in the Finder/Windows Explorer
open_stack(getOption('vfbr.stack.downloads'))

# Set the package option to control where files are downloaded
# see also ?vfbr
option(vfbr.stack.downloads="/path/to/my/stacks/folder")
}
}
\seealso{
\code{\link{gmr_stack_urls_for_ids}}
}
