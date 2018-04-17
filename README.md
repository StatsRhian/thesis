# Phd Thesis: Efficient analysis of data streams

## Abstract

Data streams provide a challenging environment for statistical analysis. Data points can
arrive at a high velocity and may need to be deleted once they have been observed. Due to these restrictions, standard techniques may not be applicable to the data streaming scenario. This leads to the need for data summaries to represent the data stream. This thesis explores how data summaries can be used to perform clustering and classification on data streams across a broad range of applications.
Spectral clustering is one such technique which prior to this work has not been applicable
to the data streaming setting due to the high computation involved. CluStream is an existing method which uses micro-clusters to summarise data streams. We present two algorithms which utilise these micro-cluster summaries to enable spectral clustering to be performed on data streams. The methods were tested on simulated data streams, as well as textured images and hand-written digits.
Distributed acoustic sensing is used to monitor oil flow at various depths throughout an
oil well. Vibrations are recorded at very high resolutions, up to 10000 observations a second at each depth. Unfortunately, corruption can occur in the signal and engineers need to know where corruption occurs. We develop a method which treats the multiple time series as a high-dimensional clustering problem and uses the cluster labels to identify changes within the signal.
The final piece of work concerns identifying areas of activity within a video stream, in
particular CCTV footage. It is more efficient if this classification stage is performed on a
compressed version of the video stream. In order to reconstruct areas of activity in the
original video a recovery algorithm is needed. We present a comparison of the performance of two recovery algorithms and identify an ideal range for the compression ratio.
