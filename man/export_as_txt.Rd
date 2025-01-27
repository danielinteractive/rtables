% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tt_export.R
\name{export_as_txt}
\alias{export_as_txt}
\title{Export as plain text with page break symbol}
\usage{
export_as_txt(
  tt,
  file = NULL,
  paginate = FALSE,
  cpp = NULL,
  ...,
  page_break = "\\\\s\\\\n",
  hsep = default_hsep(),
  indent_size = 2,
  tf_wrap = !is.null(cpp),
  max_width = cpp
)
}
\arguments{
\item{tt}{TableTree (or related class). A TableTree object representing a
populated table.}

\item{file}{character(1). File to write.}

\item{paginate}{logical(1). Should \code{tt} be paginated before writing the file.}

\item{cpp}{numeric(1) or NULL. Width (in characters) of the pages for
horizontal pagination. \code{NULL} (the default) indicates no horizontal
pagination should be done.}

\item{\dots}{Passed directly to \code{\link{paginate_table}}}

\item{page_break}{character(1). Page break symbol (defaults to outputting \code{"\\s"}).}

\item{hsep}{character(1). Set of character(s) to be repeated as the separator
between the header and body of the table when rendered as text. Defaults to
a connected horrizontal line (unicode 2014) in locals that use a UTF
charset, and to \code{-} elsewhere (with a once per session warning).}

\item{indent_size}{numeric(1). Number of spaces to use per indent level.
Defaults to 2}

\item{tf_wrap}{logical(1). Should  the texts for  title, subtitle,
and footnotes be wrapped?}

\item{max_width}{integer(1), character(1) or NULL. Width that title
and   footer   (including   footnotes)  materials   should   be
word-wrapped to. If NULL, it is  set to the current print width
of the  session (`getOption("width")`). If set to `"auto"`,
the width of the table (plus any table inset) is used. Ignored
completely if `tf_wrap` is `FALSE`.}
}
\value{
\code{file} (this function is called for the side effect of writing the file.
}
\description{
Export as plain text with page break symbol
}
\examples{

lyt <- basic_table() \%>\%
  split_cols_by("ARM") \%>\%
  analyze(c("AGE", "BMRKR2", "COUNTRY"))

tbl <- build_table(lyt, ex_adsl)

cat(export_as_txt(tbl, file = NULL, paginate = TRUE, lpp = 8))

\dontrun{
tf <- tempfile(fileext = ".txt")
export_as_txt(tbl, file = tf)
system2("cat", tf)
}
}
\seealso{
\code{export_as_pdf}
}
