# SERVICE: Apple Common Serviices
# TYPE: Functionality
# DESC: Known Required Exclusions for Apple Common Services
# VALIDATION: N/A
# REGION: North America
# DATE: Dec 23, 2024
# These primarily haven't impacted functionality noticeably, but routinely show up in the SSL decryption
# logs with errors, and hence we should exclude them to reduce overhead. Some minor functionality breakage
# for some of them but the majority is just reducing errors and overhead.

# REQUIRED
guzzoni.apple.com
api2.smoot.apple.com
cdassets.apple.com
main-sse-ws-p189.apple.com
ocsp.apple.com
ocsp2.apple.com
pancake.apple.com
experiments.apple.com
cl1.apple.com
cl2.apple.com
cl3.apple.com
cl4.apple.com
aidc.apple.com
amp-api.media.apple.com
ipcdn.apple.com
sylvan.apple.com
iphone-ld.apple.com
app-site-association.cdn-apple.com
smp-device-content.apple.com
itunes.com
