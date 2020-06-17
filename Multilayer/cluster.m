function cluster = cluster(meanx,meany,sdx,sdy,n)
    cluster(1,:) = sdx.*randn(n,1) + meanx;
    cluster(2,:) = sdy.*randn(n,1) + meany;
    cluster = cluster';
end