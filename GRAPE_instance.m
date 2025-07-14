%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GRAPE Algorithm for Multi-Robot Task Allocation (Debug/교육용)
% By Inmo Jang, 06.Oct.2015
% Modified for Debug Practice, 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) 직접 입력값 지정 (랜덤 생성 제거)

n = 5; % 에이전트 수
m = 3; % 태스크 수

environment.t_location = []; % 위치 정보 필요 없음 (단순화)
environment.a_location = [];
environment.t_demand = [15; 25; 30]; % 각 태스크의 디맨드(보상)

% MST: 에이전트 통신 네트워크
%   a1: a2, a3, a5와 연결
%   a2: a1, a3와 연결
%   a3: a1, a2, a4와 연결
%   a4: a3, a5와 연결
%   a5: a1, a4와 연결
MST = [0 1 1 0 1;  % a1 <-> a2, a3, a5 연결
       1 0 1 0 0;  % a2 <-> a1, a3 연결
       1 1 0 1 0;  % a3 <-> a1, a2, a4 연결
       0 0 1 0 1;  % a4 <-> a3, a5 연결
       1 0 0 1 0]; % a5 <-> a1, a4 연결

Alloc_existing = zeros(n,1);    % 초기 할당 (모두 void)
Flag_display = 1;               % 중간 출력 여부

input.Alloc_existing = Alloc_existing;
input.Flag_display = Flag_display;
input.MST = MST;
input.n = n;
input.m = m;
input.environment = environment;

%%%% Task Allocation 실행
[output] = Task_Allocation_SC_visual(input); % Strongly-connected 환경 가정
% Output : Alloc / a_utility / iteration

Alloc = output.Alloc;
a_utility = output.a_utility;
iteration = output.iteration;
flag_problem = output.flag_problem; % If the result has a problem, then 1. 


%% Minimum-guaranteed Global Utility (Theorem 3)
% (필요시 사용, 예제에서는 생략 가능)
% Minimum_Guaranteed_Optimality;

