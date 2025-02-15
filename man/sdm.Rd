% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_sdm.R
\name{sdm}
\alias{sdm}
\alias{sdmSimple}
\title{Signal Discrimination Model (SDM) by Oberauer (2023)}
\usage{
sdm(resp_error, version = "simple", ...)

sdmSimple(resp_error, version = "simple", ...)
}
\arguments{
\item{resp_error}{The name of the variable in the dataset containing the
response error. The response error should code the response relative to the
to-be-recalled target in radians. You can transform the response error in
degrees to radians using the \code{deg2rad} function.}

\item{version}{Character. The version of the model to use. Currently only
"simple" is supported.}

\item{...}{used internally for testing, ignore it}
}
\value{
An object of class \code{bmmodel}
}
\description{
Signal Discrimination Model (SDM) by Oberauer (2023)
}
\details{
see \href{https://venpopov.github.io/bmm/articles/bmm_sdm_simple.html}{the online article} for a detailed description of the model
and how to use it. * \strong{Domain:} Visual working memory
\itemize{
\item \strong{Task:} Continuous reproduction
\item \strong{Name:} Signal Discrimination Model (SDM) by Oberauer (2023)
\item \strong{Citation:}
\itemize{
\item Oberauer, K. (2023). Measurement models for visual working memory - A factorial model comparison. Psychological Review, 130(3), 841-852
}
\item \strong{Version:} simple
\item \strong{Requirements:}
\itemize{
\item The response variable should be in radians and represent the angular error relative to the target
}
\item \strong{Parameters:}
\itemize{
\item \code{mu}: Location parameter of the SDM distribution (in radians; by default fixed internally to 0)
\item \code{c}: Memory strength parameter of the SDM distribution
\item \code{kappa}: Precision parameter of the SDM distribution
}
\item \strong{Fixed parameters:}
\itemize{
\item \code{mu} = 0
}
\item \strong{Default parameter links:}
\itemize{
\item mu = tan_half; c = log; kappa = log
}
\item \strong{Default priors:}
\itemize{
\item \code{mu}:
\itemize{
\item \code{main}: student_t(1, 0, 1)
}
\item \code{kappa}:
\itemize{
\item \code{main}: student_t(5, 1.75, 0.75)
\item \code{effects}: normal(0, 1)
}
\item \code{c}:
\itemize{
\item \code{main}: student_t(5, 2, 0.75)
\item \code{effects}: normal(0, 1)
}
}
}
}
\examples{
\dontshow{if (isTRUE(Sys.getenv("BMM_EXAMPLES"))) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# simulate data from the model
dat <- data.frame(y = rsdm(n = 1000, c = 4, kappa = 3))

# specify formula
ff <- bmf(
  c ~ 1,
  kappa ~ 1
)

# specify the model
fit <- bmm(
  formula = ff,
  data = dat,
  model = sdm(resp_error = "y"),
  cores = 4,
  backend = "cmdstanr"
)
\dontshow{\}) # examplesIf}
}
\keyword{bmmodel}
\keyword{deprecated}
