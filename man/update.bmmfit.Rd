% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update.R
\name{update.bmmfit}
\alias{update.bmmfit}
\title{Update a bmm model}
\usage{
\method{update}{bmmfit}(object, formula., newdata = NULL, recompile = NULL, ...)
}
\arguments{
\item{object}{An object of class \code{bmmfit}}

\item{formula.}{A \code{\link[=bmmformula]{bmmformula()}}. If missing, the original formula
is used. Currently you have to specify a full \code{bmmformula}}

\item{newdata}{An optional data frame containing the variables in the model}

\item{recompile}{Logical, indicating whether the Stan model should be recompiled. If
NULL (the default), update tries to figure out internally, if recompilation
is necessary. Setting it to FALSE will cause all Stan code changing
arguments to be ignored.}

\item{...}{Further arguments passed to \code{\link[brms:update.brmsfit]{brms::update.brmsfit()}}}
}
\value{
An updated \code{bmmfit} object refit to the new data and/or formula
}
\description{
Update an existing bmm mode. This function calls
\code{\link[brms:update.brmsfit]{brms::update.brmsfit()}}, but it applies the necessary bmm postprocessing
to the model object before and after the update.
}
\details{
When updating a brmsfit created with the cmdstanr backend in a
different R session, a recompilation will be triggered because by default,
cmdstanr writes the model executable to a temporary directory. To avoid
that, set option "cmdstanr_write_stan_file_dir" to a nontemporary path of
your choice before creating the original bmmfit.

For more information and examples, see \code{\link[brms:update.brmsfit]{brms::update.brmsfit()}}
}
\examples{
\dontshow{if (isTRUE(Sys.getenv("BMM_EXAMPLES"))) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# generate artificial data from the Signal Discrimination Model
# generate artificial data from the Signal Discrimination Model
dat <- data.frame(y = rsdm(2000))

# define formula
ff <- bmf(c ~ 1, kappa ~ 1)

# fit the model
fit <- bmm(
  formula = ff,
  data = dat,
  model = sdm(resp_error = "y"),
  cores = 4,
  backend = "cmdstanr"
)

# update the model
fit <- update(fit, newdata = data.frame(y = rsdm(2000, kappa = 5)))
\dontshow{\}) # examplesIf}
}
