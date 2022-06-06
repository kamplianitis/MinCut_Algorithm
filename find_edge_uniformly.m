function [u, v] = find_edge_uniformly(AA)
    %find all the elements that have non zero values
    [row, col]= find(AA);
    
    lenrow = length(row);
    
    randa = randi([1 lenrow]);
    
    uu = row(randa);
    vv = col(randa);
    
    u = uu;
    v = vv;
end