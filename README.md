# SSL Decryption Exclusions
If you've ever had to deploy decryption in an enterprise environment for getting that extra layer of visibility and threat detection, you know just how much of a PiTA it ends up being.

My homelab emulates, as closely as possible, a true enterprise environment with SSL Inspection in place. This creates alot of headaches when services update URLs, enable certificate pinning on a service that didn't previously use it, or add ALPN into the mix.

This compilation gives you some of the common ones that I've run into, besides the expected ones.

## Functionality vs Privacy
Some of these are included for Privacy instead of functionality. This might include things that contain sensitive data such as privacy focused email, password managers, etc. They may work with decryption in place, but it might not be prudent of us to decrypt them for privacy and legal concerns.

## Contributing
Just open a pull request and add URLs, SNIs, and new services and I'll validate and approve them.

## Automatic Updates
If you want to automatically update your environment with these exclusions, one thing you can do is use an EDL on PAN-OS to pull in the data automatically. Just select the "View Raw" and copy the URL into your EDL and you should be all set to go.

## Note on Wildcards
I'll only recommend or list wildcards when it's not possible to enumerate all possible URLs. When vendors provide a complete list of all URLs, I will not provide a wildcard recommendation. However, when they don't, I likely will as a catch all, albeit as narrow as possible.

## Structure
This is structured in multiple folders:

* ipv4 - For services that have their own unique IP schema that would be best to exclude altogether, instead of being selective SNI or URLs. 
* url - For a list of URLs related to a service that need to be excluded
* sni - For a list of SNIs that might need to be excluded globally rather than in a specific policy


## Category Match for Most Sites
Overall, for most of the sensitive and legal issues we'll run into, we can use a category match to cover these types of URLs and websites.

I personally always start off with a URL Category match that is excluded from decryption at the top of my policy, covering the following categories at minimum (adjusted for locality/business risk):
```
    financial-services
    legal
    government
    health-and-medicine
    abortion
    educational-institutions
    religion
```
All of these have legal reasons why we don't want to be decrypting that traffic, in the US thats things like privileged health data, constitutional concerns, whistleblower protections, attorney-client privilege, etc. At a bare minimum, you should be excluding these URL categories from inspection. 

There are others I would generally recommend adding, but they get into the realm of insider-threat management and are something we might want to consider decrypting if we're heavily concerned about insider threats, to include:
```
    job-search
    military
    philosophy-and-political-advocacy
```
Whether you exclude those or not is a risk-management decision. If an employee is visiting some fringe-political or philosophy websites and we later have to perform an insider-threat investigation, some of this data might be helpful for us to analyze. 
