% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expgrowth.R
\name{expgrowth}
\alias{expgrowth}
\alias{dexpgrowth}
\alias{pexpgrowth}
\alias{rexpgrowth}
\title{Exponential growth distribution functions}
\usage{
dexpgrowth(x, min = 0, max = 1, r, log = FALSE)

pexpgrowth(q, min = 0, max = 1, r, lower.tail = TRUE, log.p = FALSE)

rexpgrowth(n, min = 0, max = 1, r)
}
\arguments{
\item{x, q}{Vector of quantiles.}

\item{min}{Minimum value of the distribution range. Default is 0.}

\item{max}{Maximum value of the distribution range. Default is 1.}

\item{r}{Rate parameter for the exponential growth.}

\item{log, log.p}{Logical; if TRUE, probabilities p are given as log(p).}

\item{lower.tail}{Logical; if TRUE (default), probabilities are P[X <= x],
otherwise, P[X > x].}

\item{n}{Number of observations. If \code{length(n) > 1}, the length is taken to
be the number required.}
}
\value{
\code{dexpgrowth} gives the density, \code{pexpgrowth} gives the distribution
function, and \code{rexpgrowth} generates random deviates.

The length of the result is determined by \code{n} for \code{rexpgrowth}, and is the
maximum of the lengths of the numerical arguments for the other functions.
}
\description{
Density, distribution function, and random generation for the exponential
growth distribution.
}
\details{
The exponential growth distribution is defined on the interval [min, max]
with rate parameter (r). Its probability density function (PDF) is:

\deqn{f(x) = \frac{r \cdot \exp(r \cdot (x - min))}{\exp(r \cdot max) -
 \exp(r \cdot min)}}

The cumulative distribution function (CDF) is:

\deqn{F(x) = \frac{\exp(r \cdot (x - min)) - \exp(r \cdot min)}{
 \exp(r \cdot max) - \exp(r \cdot min)}}

For random number generation, we use the inverse transform sampling method:
\enumerate{
\item Generate \eqn{u \sim \text{Uniform}(0,1)}
\item Set \eqn{F(x) = u} and solve for \eqn{x}:
\deqn{
   x = min + \frac{1}{r} \cdot \log(u \cdot (\exp(r \cdot max) -
  \exp(r \cdot min)) + \exp(r \cdot min))
   }
}

This method works because of the probability integral transform theorem,
which states that if \eqn{X} is a continuous random variable with CDF
\eqn{F(x)}, then \eqn{Y = F(X)} follows a \eqn{\text{Uniform}(0,1)}
distribution. Conversely, if \eqn{U} is a \eqn{\text{Uniform}(0,1)} random
variable, then \eqn{F^{-1}(U)} has the same distribution as \eqn{X}, where
\eqn{F^{-1}} is the inverse of the CDF.

In our case, we generate \eqn{u} from \eqn{\text{Uniform}(0,1)}, then solve
\eqn{F(x) = u} for \eqn{x} to get a sample from our exponential growth
distribution. The formula for \eqn{x} is derived by algebraically solving
the equation:

\deqn{
u = \frac{\exp(r \cdot (x - min)) - \exp(r \cdot min)}{\exp(r \cdot max) -
 \exp(r \cdot min)}
}

When \eqn{r} is very close to 0 (\eqn{|r| < 1e-10}), the distribution
approximates a uniform distribution on [min, max], and we use a simpler
method to generate samples directly from this uniform distribution.
}
\examples{
x <- seq(0, 1, by = 0.1)
probs <- dexpgrowth(x, r = 0.2)
cumprobs <- pexpgrowth(x, r = 0.2)
samples <- rexpgrowth(100, r = 0.2)

}
\concept{primaryeventdistributions}
