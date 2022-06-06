function nodef = update_nodes(nodes, u, v)
    a= length(nodes{v});
    for i=1:a
        b = length(nodes{u});
        nodes{u}(b+1) = nodes{v}(i);
    end
    nodes(v)=[];
    nodef = nodes;
end