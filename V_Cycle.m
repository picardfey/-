% 函数部分
function phi = V_Cycle(phi, f, h, k)
 % 递归V循环多重网格方法，用于解决间距为h的均匀网格上的Helmholtz方程(k^2*phi + nabla^2 phi = f)
 
 % 预光滑
 phi = smoothing_pre(phi, f, h, k);
 
 % 计算残差
 r = residual(phi, f, h, k);
 
 % 限制
 rhs = restriction(r);
 
 eps = zeros(size(rhs));
 
 % 在最小网格大小处停止递归，否则继续递归
 if size(eps, 1)-1 == 2
     eps = smoothing_pre(eps, rhs, 2*h, k);
 else        
     eps = V_Cycle(eps, rhs, 2*h, k) ;
 end
 
 % 插值和校正
 phi = phi + prolongation(eps);

 % 后光滑
 phi = smoothing_after(phi, f, h, k);
 
end