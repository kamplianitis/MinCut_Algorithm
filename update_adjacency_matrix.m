function AA = update_adjacency_matrix(adjacencyM, u, v)
    for i=1:length(adjacencyM)
        if( adjacencyM(v,i) > 0 && i~= u)
            adjacencyM(u,i) = adjacencyM(u,i) + adjacencyM(v,i);
            adjacencyM(i,u) = adjacencyM(i,u) + adjacencyM(i,v);
        else
            continue
        end
    end
    %delete the row and the collumn
    adjacencyM(v,:) = [];
    adjacencyM(:,v) = [];
    
    AA = adjacencyM;
end