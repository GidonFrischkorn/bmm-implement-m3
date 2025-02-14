% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers-postprocess.R
\name{postprocess_brm}
\alias{postprocess_brm}
\title{Generic S3 method for postprocessing the fitted brm model}
\usage{
postprocess_brm(model, fit, ...)
}
\arguments{
\item{model}{A model list object returned from check_model()}

\item{fit}{the fitted brm model returned by \code{call_brm()}}

\item{...}{Additional arguments passed to the method}
}
\value{
An object of class brmsfit, with any necessary postprocessing applied
}
\description{
Called by bmm() to automatically perform some type of postprocessing
depending on the model type. It will call the appropriate postprocess_brm.*
methods based on the list of classes defined in the .model_* functions. For
models with several classes listed, it will call the functions in the order
they are listed. Thus, any operations that are common to a group of models
should be defined in the appropriate postprocess_brm.* function, where \*
corresponds to the shared class. For example, for the sdm model, the
postprocessing involves setting the link function for the c parameter to "log",
because it was coded manually in the stan code, but it was specified as "identity"
in the brms custom family. If your model requires no postprocessing, you can
skip this method, and the default method will be used (which returns the same
brmsfit object that was passed to it).
}
\examples{
\dontshow{if (isTRUE(Sys.getenv("BMM_EXAMPLES"))) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
fit <- readRDS("my_saved_fit.rds")
postprocessed_fit <- prostprocess_brm(fit)
\dontshow{\}) # examplesIf}
}
\keyword{developer}
\keyword{internal}
