%Mean Supraglacial Water Depth from Grau et al., 2025.
function wat_dep = wd_param(H, sig, w_S)
wd_star = sig.*(0.2-0.12*H.^0.6);
S = w_S./wd_star;
wat_dep = sig.*(erf(0.27*S).*(0.9-0.08*H.^0.6 -0.72*erf(0.76*S))); %with Error Function 
end