%Mean Supraglacial Lake Depth from Grau et al., 2025.
function lak_dep = wl_param(H, sig, w_S)
wd_star = sig.*(0.2-0.12*H.^0.6);
S = w_S./wd_star;
lak_dep = 0.6*sig.*erf(67*S).*(1-0.41*H.^0.6); %With Error Function
end
