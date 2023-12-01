Removal of Noise from speech audio signal

Noise is ubiquitous in almost all acoustic environments. The speech signal recorded by
microphone is generally infected by noise originating from various sources. Such
contamination can change the characteristics of speech signals and degrade speech quality
and intelligibility, thereby causing significant harm to human-to-machine communication
systems. Noise detection and reduction for speech applications are often formulated as a
digital filtering problem. The clean speech estimation is obtained by passing the noisy speech
through an adaptive filter. With such a formulation, the core issue of noise reduction becomes
how to design an optimal filter that can significantly suppress noise without noticeable
speech distortion.

DSP Technique used
 The technique have used is  LMS algorithm.Least mean squares (LMS) algorithms are class
of adaptive filter used to mimic a desired filter by finding the filter coefficients
that relate to producing the least mean square of the error signal. In practice,
we don’t know statistical information of the input such as the auto-correlation
function R xx Adaptive Filters and LMS algorithm does not need this
information to accomplish noise cancellation. Furthermore, the LMS
algorithm requires fewer mathematical complications than other algorithms
(such as RLS), and is also easier to be implemented in practice.

Estimated error: e(k) = y1(k) − y'2(k)
Updated weight: w(k+ 1) = w(k) + μe(k)∗y2(k)
where, μ=step size
y1(k)desired signal at kth time
y'2(k):weighted pure noise corrupted signal at kth time
y2(k): noise corrupted signal at kth time
w(k): column weight vector of the filter at k th time
