%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Given situation, this function is used to obtain an agent's utility 
% [Input]
% - agent_id
% - task_id
% - participants (number_of_members)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [util_value] = Get_Util(agent_id, task_id, n_participants, environment)

t_demand = environment.t_demand;

%% Utility Type: Debug_practice only
Util_type = 'Debug_practice';

switch Util_type
    case 'Debug_practice'
        util_value = t_demand(task_id) / n_participants;
end

if util_value < 0
    util_value = 0;
end
end
