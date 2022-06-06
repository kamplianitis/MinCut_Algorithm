function A = generate_adjacency_matrix(n, min_cut_weight)
    
    adjacencyM = zeros(n);
    %% creation of c edges betweeen 1 and 2...c+1
    for i=1:min_cut_weight+1
        adjacencyM(1,i) = 1;
        adjacencyM(i,1) = 1;
    end
    
    %% rest of the nodes
   adjacencyM = zeros(n);
    %% creation of c edges betweeen 1 and 2...c+1
    for i=1:min_cut_weight+1
        adjacencyM(1,i) = 1;
        adjacencyM(i,1) = 1;
    end
    
    %% rest of the nodes
    for j=2:n-1
        % number of edges that will have the ith vetrice
        numofedges = randi(10);
        % find how many edges i have now so that i can compare with the
        % rand number .... case more edges have came from other vetrices
        numofedgesnow = sum(adjacencyM(j,:));
        % if the i is in that range it has already an edge
        if( j < min_cut_weight+1)
            while (numofedgesnow < numofedges +1)
                newE = randi([j+1 n ]);
                % i have to check if this vetrice has more than the legal
                % values
               if( newE <= min_cut_weight+1)
                   newEline = sum(adjacencyM(newE,:));
                   if (newEline < 11)
                    adjacencyM(j,newE) = adjacencyM(j,newE) + 1;
                    adjacencyM(newE,j) = adjacencyM(newE,j) +1;
                    numofedgesnow = numofedgesnow +1;
                   end
               else
                    newEline = sum(adjacencyM(newE,:));
                    if (newEline < 10)
                    adjacencyM(j,newE) = adjacencyM(j,newE) + 1;
                    adjacencyM(newE,j) = adjacencyM(newE,j) +1;
                    numofedgesnow = numofedgesnow +1;
                   end
               end
            end
        else
            while (numofedgesnow < numofedges)
                newE = randi([j+1 n ]);
                % i have to check if this vetrice has more than the legal
                % values
               if( newE <= min_cut_weight+1)
                   newEline = sum(adjacencyM(newE,:));
                   if (newEline < 11)
                    adjacencyM(j,newEdge) = adjacencyM(j,newEdge) + 1;
                    adjacencyM(newEdge,j) = adjacencyM(newEdge,j) +1;
                    numofedgesnow = numofedgesnow +1;
                   end
               else
                    newEline = sum(adjacencyM(newE,:));
                    if (newEline < 10)
                    adjacencyM(j,newE) = adjacencyM(j,newE) + 1;
                    adjacencyM(newE,j) = adjacencyM(newE,j) +1;
                    numofedgesnow = numofedgesnow +1;
                   end
               end
            end
        end
    end
    % case last element of the table has no edges
    worstcasescenario = sum(adjacencyM(n,:));
    while worstcasescenario == 0
        edgetocomplete = randi(n-1);
        if( edgetocomplete <= min_cut_weight+1) 
            sumoff = sum(adjacencyM(edgetocomplete,:));
            if ( sumoff < 11)
               adjacencyM(n,edgetocomplete) = adjacencyM(n,edgetocomplete) + 1;
               adjacencyM(edgetocomplete,j) = adjacencyM(edgetocomplete,n) +1; 
               worstcasescenario = 1;
            end
        else
            if( sumoff < 10)
               adjacencyM(n,edgetocomplete) = adjacencyM(n,edgetocomplete) + 1;
               adjacencyM(edgetocomplete,j) = adjacencyM(edgetocomplete,n) +1; 
               worstcasescenario = 1;
            end
        end
    end
    A = adjacencyM;
end