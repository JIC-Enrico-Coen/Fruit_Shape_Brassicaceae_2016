function m = gpt_latiseptate2_20140909( m )
%m = gpt_latiseptate2_20140909( m )
%   Morphogen interaction function.
%   Written at 2015-03-05 16:49:25.
%   GFtbox revision 5112, 2014-10-09 12:30.

% The user may edit any part of this function between delimiters
% of the form "USER CODE..." and "END OF USER CODE...".  The
% delimiters themselves must not be moved, edited, deleted, or added.

if isempty(m), return; end

fprintf( 1, '%s found in %s\n', mfilename(), which(mfilename()) );

try
    m = local_setproperties( m );
catch
end

realtime = m.globalDynamicProps.currenttime;

%%% USER CODE: INITIALISATION

% In this section you may modify the mesh in any way whatsoever.
if (Steps(m)==0) && m.globalDynamicProps.doinit % First iteration
    m.fixedDFmap(:) = false; % unfix all vertices from the start.
    m = leaf_plotoptions( m, 'hiresdpi', 300);
    
end
%%% END OF USER CODE: INITIALISATION

%%% SECTION 1: ACCESSING MORPHOGENS AND TIME.
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.

if isempty(m), return; end

setGlobals();
global gNEW_KA_PAR gNEW_KA_PER gNEW_KB_PAR gNEW_KB_PER
global gNEW_K_NOR gNEW_POLARISER gNEW_STRAINRET gNEW_ARREST
dt = m.globalProps.timestep;
polariser_i = gNEW_POLARISER;
P = m.morphogens(:,polariser_i);
[kapar_i,kapar_p,kapar_a,kapar_l] = getMgenLevels( m, 'KAPAR' );
[kaper_i,kaper_p,kaper_a,kaper_l] = getMgenLevels( m, 'KAPER' );
[kbpar_i,kbpar_p,kbpar_a,kbpar_l] = getMgenLevels( m, 'KBPAR' );
[kbper_i,kbper_p,kbper_a,kbper_l] = getMgenLevels( m, 'KBPER' );
[knor_i,knor_p,knor_a,knor_l] = getMgenLevels( m, 'KNOR' );
[strainret_i,strainret_p,strainret_a,strainret_l] = getMgenLevels( m, 'STRAINRET' );
[arrest_i,arrest_p,arrest_a,arrest_l] = getMgenLevels( m, 'ARREST' );
[id_mid_i,id_mid_p,id_mid_a,id_mid_l] = getMgenLevels( m, 'ID_MID' );
[id_style_i,id_style_p,id_style_a,id_style_l] = getMgenLevels( m, 'ID_STYLE' );
[id_base_i,id_base_p,id_base_a,id_base_l] = getMgenLevels( m, 'ID_BASE' );
[s_style_i,s_style_p,s_style_a,s_style_l] = getMgenLevels( m, 'S_STYLE' );
[id_rep_i,id_rep_p,id_rep_a,id_rep_l] = getMgenLevels( m, 'ID_REP' );
[id_lphase_i,id_lphase_p,id_lphase_a,id_lphase_l] = getMgenLevels( m, 'ID_LPHASE' );
[id_midvalve_i,id_midvalve_p,id_midvalve_a,id_midvalve_l] = getMgenLevels( m, 'ID_MIDVALVE' );
[id_gmidvalve_i,id_gmidvalve_p,id_gmidvalve_a,id_gmidvalve_l] = getMgenLevels( m, 'ID_GMIDVALVE' );
[id_gprox_i,id_gprox_p,id_gprox_a,id_gprox_l] = getMgenLevels( m, 'ID_GPROX' );
[id_gdist_i,id_gdist_p,id_gdist_a,id_gdist_l] = getMgenLevels( m, 'ID_GDIST' );
[id_inhibitbase_i,id_inhibitbase_p,id_inhibitbase_a,id_inhibitbase_l] = getMgenLevels( m, 'ID_INHIBITBASE' );
[s_inhibitbase_i,s_inhibitbase_p,s_inhibitbase_a,s_inhibitbase_l] = getMgenLevels( m, 'S_INHIBITBASE' );
[id_mphase_i,id_mphase_p,id_mphase_a,id_mphase_l] = getMgenLevels( m, 'ID_MPHASE' );
[id_inhibittop_i,id_inhibittop_p,id_inhibittop_a,id_inhibittop_l] = getMgenLevels( m, 'ID_INHIBITTOP' );
[id_ephase_i,id_ephase_p,id_ephase_a,id_ephase_l] = getMgenLevels( m, 'ID_EPHASE' );
[id_shoulders_i,id_shoulders_p,id_shoulders_a,id_shoulders_l] = getMgenLevels( m, 'ID_SHOULDERS' );
[id_proxorg_i,id_proxorg_p,id_proxorg_a,id_proxorg_l] = getMgenLevels( m, 'ID_PROXORG' );
[id_distorg_i,id_distorg_p,id_distorg_a,id_distorg_l] = getMgenLevels( m, 'ID_DISTORG' );
[s_inhibittop_i,s_inhibittop_p,s_inhibittop_a,s_inhibittop_l] = getMgenLevels( m, 'S_INHIBITTOP' );
[s_inhibitmv_i,s_inhibitmv_p,s_inhibitmv_a,s_inhibitmv_l] = getMgenLevels( m, 'S_INHIBITMV' );
[s_base_i,s_base_p,s_base_a,s_base_l] = getMgenLevels( m, 'S_BASE' );
[id_ful_i,id_ful_p,id_ful_a,id_ful_l] = getMgenLevels( m, 'ID_FUL' );

% Mesh type: cylinder
%         basecap: 0
%      baseheight: 1
%       baserings: 0
%          centre: 0
%      circumdivs: 30
%          height: 40
%      heightdivs: 25
%          layers: 0
%      randomness: 0.001
%       thickness: 0
%          topcap: 0
%       topheight: 1
%        toprings: 0
%          xwidth: 80
%          ywidth: 60

%            Morphogen    Diffusion   Decay   Dilution   Mutant
%            --------------------------------------------------
%                KAPAR         ----    ----       ----     ----
%                KAPER         ----    ----       ----     ----
%                KBPAR         ----    ----       ----     ----
%                KBPER         ----    ----       ----     ----
%                 KNOR         ----    ----       ----     ----
%            POLARISER            5    ----       ----     ----
%            STRAINRET         ----    ----       ----     ----
%               ARREST         ----    ----       ----     ----
%               ID_MID         ----    ----       ----     ----
%             ID_STYLE         ----    ----       ----     ----
%              ID_BASE         ----    ----       ----     ----
%              S_STYLE         ----    ----       ----     ----
%               ID_REP         ----    ----       ----     ----
%            ID_LPHASE         ----    ----       ----     ----
%          ID_MIDVALVE         ----    ----       ----     ----
%         ID_GMIDVALVE         ----    ----       ----     ----
%             ID_GPROX         ----    ----       ----     ----
%             ID_GDIST         ----    ----       ----     ----
%       ID_INHIBITBASE         ----    ----       ----     ----
%        S_INHIBITBASE         ----    ----       ----     ----
%            ID_MPHASE         ----    ----       ----     ----
%        ID_INHIBITTOP         ----    ----       ----     ----
%            ID_EPHASE         ----    ----       ----     ----
%         ID_SHOULDERS         ----    ----       ----     ----
%           ID_PROXORG         ----    ----       ----     ----
%           ID_DISTORG         ----    ----       ----     ----
%         S_INHIBITTOP         ----    ----       ----     ----
%          S_INHIBITMV         ----    ----       ----     ----
%               S_BASE         ----    ----       ----     ----
%               ID_FUL         ----    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

if (Steps(m)==0) && m.globalDynamicProps.doinit  % Initialisation code.
    %% PRN Polariser Regulatory Network
    
    proxorg_ind= m.nodes(:,3)<-19.5;
    id_proxorg_p(proxorg_ind) = 1;
    P(proxorg_ind) = 1;
    m = leaf_fix_mgen( m, polariser_i,'vertex',find(proxorg_ind),'fix', 1);
    
    m = leaf_mgen_conductivity(m, polariser_i, 5);
    m = leaf_mgen_absorption(m, polariser_i, 0);
    
    id_distorg_p(m.nodes(:,3)>17.5) = 1;
    
    basenodes_ind= min(m.nodes(:,3));
    id_basenodes_p(m.nodes(:,3)==basenodes_ind) =1;
    
    m.fixedDFmap( id_basenodes_p==1, 3 ) = true;
    
    
    %% Growth factors
    
    % STYLE
    id_style_p(m.nodes(:,3)>10) = 1;
    
    m.mgen_production(:, s_style_i) = id_style_p;           % whereever id_style is s_rep is produced
    m = leaf_mgen_conductivity(m, s_style_i, 0.4);      % how much s_style is conducted
    m = leaf_mgen_absorption(m, s_style_i, 0);         % how much s_style is degraded at each node
    m = leaf_mgen_dilution(m, s_style_i, 0);
    
    m.morphogenclamp( id_style_p==1, s_style_i ) = 1;       % Clamping the highest value of s_style to 1.
    s_style_p = 1 * id_style_p;
    
    % BASE
    id_base_p(m.nodes(:,3)<-16) = 1;
    
    m.mgen_production(:, s_base_i) = id_base_p;           % whereever id_rep is s_rep is produced
    m = leaf_mgen_conductivity(m, s_base_i, 0.4);      % how much s_rep is conducted
    m = leaf_mgen_absorption(m, s_base_i, 0);         % how much s_rep is degraded at each node
    m = leaf_mgen_dilution(m, s_base_i, 0);
    
    m.morphogenclamp( id_base_p==1, s_base_i ) = 1;       % Clamping the highest value of s_base to 1.
    s_base_p = 1 * id_base_p;
    
    % REP
    id_rep_p((abs(m.nodes(:,1))<10)&(m.nodes(:,3)<10)) = 1;
    
    % MIDVALVE
    id_midvalve_p((abs(m.nodes(:,2))<7.5)&(m.nodes(:,3)<10)) = 1;
    
    % SHOULDERS
    id_shoulders_p(m.nodes(:,3)>0) = 1;
    
    % INHIBITBASE
    m.mgen_production(:, s_inhibitbase_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_inhibitbase_i,15);      % factor used to set up gdist
    m = leaf_mgen_absorption(m, s_inhibitbase_i, 0);
    m = leaf_mgen_dilution(m, s_inhibitbase_i, 0);
    
    m.morphogenclamp(((id_base_p==1)|(id_shoulders_p>0)|(id_midvalve_p>0)), s_inhibitbase_i ) = 1;       % Clamping the highest value of s_inhibitbase to 1 and in the shoulders to 0 to make a linear gradient.
    s_inhibitbase_p = 1 * id_base_p;
    
    % INHIBITMV
    m.mgen_production(:, s_inhibitmv_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_inhibitmv_i,15);      % factor used to set up gdist
    m = leaf_mgen_absorption(m, s_inhibitmv_i, 0);
    m = leaf_mgen_dilution(m, s_inhibitmv_i, 0);
    
    m.morphogenclamp(((id_base_p==1)|(id_shoulders_p>0)), s_inhibitmv_i ) = 1;       % Clamping the highest value of s_inhibitbase to 1 and in the shoulders to 0 to make a linear gradient.
    s_inhibitmv_p = 1 * id_base_p;
    
    % INHIBITTOP
    
    id_inhibittop_p((m.nodes(:,3)>5)&(m.nodes(:,3)<14)&(abs(m.nodes(:,2))>7.5)&(m.nodes(:,3)<14)) = 1; %;
    
    m.mgen_production(:, s_inhibittop_i) = id_inhibittop_p;
    m = leaf_mgen_conductivity(m, s_inhibittop_i,5);      % factor used to inhibit kpar at top
    m = leaf_mgen_absorption(m, s_inhibittop_i, 0);
    m = leaf_mgen_dilution(m, s_inhibittop_i, 0);
    
    m.morphogenclamp(((id_inhibittop_p==1)|(id_base_p>0)|(id_midvalve_p>0)|(id_style_p>0)), s_inhibittop_i ) = 1;       % Clamping the highest value of s_inhibitbase to 1 and at Base 0 to make a linear gradient
    s_inhibittop_p = 1 * id_inhibittop_p;
    
end

if Steps(m)==3
    
    % STYLE
    
    m.mgen_production(:, s_style_i) = id_style_p;
    m = leaf_mgen_conductivity(m, s_style_i, 0);      % stop conductivity, fixing valves of s_style
    m = leaf_mgen_absorption(m, s_style_i, 0);
    m = leaf_mgen_dilution(m, s_style_i, 0);
    
    % BASE
    
    m.mgen_production(:, s_base_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_base_i, 0);      % stop conductivity, clamping values of s_base
    m = leaf_mgen_absorption(m, s_base_i, 0);
    m = leaf_mgen_dilution(m, s_base_i, 0);
    
end

if Steps(m)==6
    
    % INHIBITBASE
    m.mgen_production(:, s_inhibitbase_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_inhibitbase_i, 0);
    m = leaf_mgen_absorption(m, s_inhibitbase_i, 0);
    m = leaf_mgen_dilution(m, s_inhibitbase_i, 0);
    
    
    %INHIBITTOP
    
    m.mgen_production(:, s_inhibittop_i) = id_inhibittop_p;
    m = leaf_mgen_conductivity(m, s_inhibittop_i,0);
    m = leaf_mgen_absorption(m, s_inhibittop_i, 0);
    m = leaf_mgen_dilution(m, s_inhibittop_i, 0);
    
    % INHIBITMV
    m.mgen_production(:, s_inhibitmv_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_inhibitmv_i,0);      % factor used to set up gdist
    m = leaf_mgen_absorption(m, s_inhibitmv_i, 0);
    m = leaf_mgen_dilution(m, s_inhibitmv_i, 0);
    
    % GMIDVALVE
    
    id_gmidvalve_p= (1 - s_inhibitmv_p - s_style_p) .*id_midvalve_p ;
    
    % GDIST
    
    id_gdist_p= (1 - s_inhibitbase_p - s_style_p);
    
end

if realtime>=0
    
    % EPHASE
    
    id_ephase_p(abs(m.nodes(:,3))>0) = 1;
    
end

if realtime >=48
    
    % EPHASE
    
    id_ephase_p(abs(m.nodes(:,3))>0) = 0;
    
    % MPHASE
    
    id_mphase_p(abs(m.nodes(:,3))>0) = 1;
    
    
    
end


if realtime >=192
    
    % MPHASE
    
    id_mphase_p(abs(m.nodes(:,3))>0) = 0;
    
    % LPHASE
    
    id_lphase_p(abs(m.nodes(:,3))>0) = 1;
    
    
    
end


if realtime >=0
    %% KRN
    
    
    kapar_p(:) = 0.014.*pro(1,id_ephase_p)...                   % promote growth in length in the early phase
        .*pro(0.2,id_rep_p.*id_mphase_p)...       % Promote kpar in the replum to flatten the model medially
        .*inh(5,id_base_p.*id_mphase_p)...
        .*pro(0.15,id_rep_p.*id_lphase_p)...      % Promote kpar in the replum to flatten the model medially
        .*inh(1,s_style_p.*id_lphase_p);          % inhibit kpar in the style during the late phase
    
    
    
    
    
    kbpar_p(:) = kapar_p;
    
    kaper_p(:) = 0.0125.*inh(1,s_base_p.*id_mphase_p)...        % inhibit base to generate the narrow base
        .*inh(3,id_style_p.*id_mphase_p)...       % inhibit in the style to generate the narrow style
        .*inh(2,id_rep_p.*id_mphase_p)...         % inhibit in the rep to stop the region getting wider as kpar is high in this region
        .*inh(1,s_base_p.*id_lphase_p)...         % inhibit base by s_base in the late phase to stop the proximal regions bulging out
        .*inh(2,s_style_p.*id_lphase_p)...        % inhibit base by s_style in the late phase to stop the distal regions bulging out
        .*inh(2,id_rep_p.*id_lphase_p)...
        .*inh(1,id_midvalve_p.*id_mphase_p)...
        .*inh(1,id_midvalve_p.*id_lphase_p);
    
    
    kbper_p(:) = kaper_p;
    
    knor_p(:) = 0.01;
end
%%% END OF USER CODE: MORPHOGEN INTERACTIONS

%%% SECTION 3: INSTALLING MODIFIED VALUES BACK INTO MESH STRUCTURE
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.
m.morphogens(:,polariser_i) = P;
m.morphogens(:,kapar_i) = kapar_p;
m.morphogens(:,kaper_i) = kaper_p;
m.morphogens(:,kbpar_i) = kbpar_p;
m.morphogens(:,kbper_i) = kbper_p;
m.morphogens(:,knor_i) = knor_p;
m.morphogens(:,strainret_i) = strainret_p;
m.morphogens(:,arrest_i) = arrest_p;
m.morphogens(:,id_mid_i) = id_mid_p;
m.morphogens(:,id_style_i) = id_style_p;
m.morphogens(:,id_base_i) = id_base_p;
m.morphogens(:,s_style_i) = s_style_p;
m.morphogens(:,id_rep_i) = id_rep_p;
m.morphogens(:,id_lphase_i) = id_lphase_p;
m.morphogens(:,id_midvalve_i) = id_midvalve_p;
m.morphogens(:,id_gmidvalve_i) = id_gmidvalve_p;
m.morphogens(:,id_gprox_i) = id_gprox_p;
m.morphogens(:,id_gdist_i) = id_gdist_p;
m.morphogens(:,id_inhibitbase_i) = id_inhibitbase_p;
m.morphogens(:,s_inhibitbase_i) = s_inhibitbase_p;
m.morphogens(:,id_mphase_i) = id_mphase_p;
m.morphogens(:,id_inhibittop_i) = id_inhibittop_p;
m.morphogens(:,id_ephase_i) = id_ephase_p;
m.morphogens(:,id_shoulders_i) = id_shoulders_p;
m.morphogens(:,id_proxorg_i) = id_proxorg_p;
m.morphogens(:,id_distorg_i) = id_distorg_p;
m.morphogens(:,s_inhibittop_i) = s_inhibittop_p;
m.morphogens(:,s_inhibitmv_i) = s_inhibitmv_p;
m.morphogens(:,s_base_i) = s_base_p;
m.morphogens(:,id_ful_i) = id_ful_p;

%%% USER CODE: FINALISATION

if realtime == 160
    m = leaf_subdivide( m, 'morphogen','id_rep',...
        'min',0.5,'max',1,...
        'mode','mid','levels','all');
    
end
%%% END OF USER CODE: FINALISATION

end


%%% USER CODE: SUBFUNCTIONS

function m = local_setproperties( m )
% This function is called at time zero in the INITIALISATION section of the
% interaction function.  It provides commands to set each of the properties
% that are contained in m.globalProps.  Uncomment whichever ones you would
% like to set yourself, and put in whatever value you want.
%
% Some of these properties are for internal use only and should never be
% set by the user.  At some point these will be moved into a different
% component of m, but for the present, just don't change anything unless
% you know what it is you're changing.

%    m = leaf_setproperty( m, 'trinodesvalid', true );
%    m = leaf_setproperty( m, 'prismnodesvalid', true );
%    m = leaf_setproperty( m, 'thicknessRelative', 8.000000 );
%    m = leaf_setproperty( m, 'thicknessArea', 0.000000 );
%    m = leaf_setproperty( m, 'thicknessMode', 'physical' );
%    m = leaf_setproperty( m, 'activeGrowth', 1.000000 );
%    m = leaf_setproperty( m, 'displayedGrowth', 1.000000 );
%    m = leaf_setproperty( m, 'displayedMulti', [] );
%    m = leaf_setproperty( m, 'allowNegativeGrowth', true );
%    m = leaf_setproperty( m, 'usePrevDispAsEstimate', true );
%    m = leaf_setproperty( m, 'perturbInitGrowthEstimate', 0.000010 );
%    m = leaf_setproperty( m, 'perturbRelGrowthEstimate', 0.010000 );
%    m = leaf_setproperty( m, 'perturbDiffusionEstimate', 0.000100 );
%    m = leaf_setproperty( m, 'resetRand', false );
%    m = leaf_setproperty( m, 'mingradient', 0.000000 );
%    m = leaf_setproperty( m, 'relativepolgrad', false );
%    m = leaf_setproperty( m, 'usefrozengradient', true );
%    m = leaf_setproperty( m, 'userpolarisation', false );
%    m = leaf_setproperty( m, 'thresholdsq', 83.702412 );
%    m = leaf_setproperty( m, 'splitmargin', 1.400000 );
%    m = leaf_setproperty( m, 'splitmorphogen', '' );
%    m = leaf_setproperty( m, 'thresholdmgen', 0.500000 );
%    m = leaf_setproperty( m, 'bulkmodulus', 1.000000 );
%    m = leaf_setproperty( m, 'unitbulkmodulus', true );
%    m = leaf_setproperty( m, 'poissonsRatio', 0.300000 );
%    m = leaf_setproperty( m, 'starttime', 0.000000 );
m = leaf_setproperty( m, 'timestep', 4 );
%    m = leaf_setproperty( m, 'timeunitname', '' );
%    m = leaf_setproperty( m, 'distunitname', 'mm' );
%    m = leaf_setproperty( m, 'scalebarvalue', 0.000000 );
%    m = leaf_setproperty( m, 'validateMesh', true );
%    m = leaf_setproperty( m, 'rectifyverticals', false );
%    m = leaf_setproperty( m, 'allowSplitLongFEM', true );
%    m = leaf_setproperty( m, 'longSplitThresholdPower', 0.000000 );
%    m = leaf_setproperty( m, 'allowSplitBentFEM', false );
%    m = leaf_setproperty( m, 'allowSplitBio', true );
%    m = leaf_setproperty( m, 'allowFlipEdges', false );
%    m = leaf_setproperty( m, 'allowElideEdges', true );
%    m = leaf_setproperty( m, 'mincellangle', 0.200000 );
%    m = leaf_setproperty( m, 'mincellrelarea', 0.040000 );
%    m = leaf_setproperty( m, 'alwaysFlat', 0.000000 );
%    m = leaf_setproperty( m, 'flattenforceconvex', true );
%    m = leaf_setproperty( m, 'flatten', false );
%    m = leaf_setproperty( m, 'flattenratio', 1.000000 );
%    m = leaf_setproperty( m, 'useGrowthTensors', false );
%    m = leaf_setproperty( m, 'plasticGrowth', false );
%    m = leaf_setproperty( m, 'maxFEcells', 0 );
%    m = leaf_setproperty( m, 'inittotalcells', 0 );
%    m = leaf_setproperty( m, 'bioApresplitproc', '' );
%    m = leaf_setproperty( m, 'bioApostsplitproc', '' );
%    m = leaf_setproperty( m, 'maxBioAcells', 0 );
%    m = leaf_setproperty( m, 'biosplitarea', 0.000000 );
%    m = leaf_setproperty( m, 'biosplitarrestmgen', 'ARREST' );
%    m = leaf_setproperty( m, 'biosplitarrestmgenthreshold', 0.990000 );
%    m = leaf_setproperty( m, 'colors', (6 values) );
%    m = leaf_setproperty( m, 'colorvariation', 0.050000 );
%    m = leaf_setproperty( m, 'colorparams', (12 values) );
%    m = leaf_setproperty( m, 'biocolormode', 'auto' );
%    m = leaf_setproperty( m, 'canceldrift', false );
%    m = leaf_setproperty( m, 'mgen_interaction', '' );
%    m = leaf_setproperty( m, 'mgen_interactionName', 'gpt_isotropic_growth_ealry_phase_20140826' );
%    m = leaf_setproperty( m, 'allowInteraction', true );
%    m = leaf_setproperty( m, 'interactionValid', true );
%    m = leaf_setproperty( m, 'gaussInfo', (unknown type ''struct'') );
%    m = leaf_setproperty( m, 'D', (36 values) );
%    m = leaf_setproperty( m, 'C', (36 values) );
%    m = leaf_setproperty( m, 'G', (6 values) );
%    m = leaf_setproperty( m, 'solver', 'cgs' );
%    m = leaf_setproperty( m, 'solverprecision', 'double' );
%    m = leaf_setproperty( m, 'solvertolerance', 0.001000 );
%    m = leaf_setproperty( m, 'solvertolerancemethod', 'max' );
%    m = leaf_setproperty( m, 'diffusiontolerance', 0.000010 );
%    m = leaf_setproperty( m, 'allowsparse', true );
%    m = leaf_setproperty( m, 'maxIters', 0 );
%    m = leaf_setproperty( m, 'maxsolvetime', 1000.000000 );
%    m = leaf_setproperty( m, 'cgiters', 0 );
%    m = leaf_setproperty( m, 'simsteps', 0 );
%    m = leaf_setproperty( m, 'stepsperrender', 0 );
%    m = leaf_setproperty( m, 'growthEnabled', true );
%    m = leaf_setproperty( m, 'diffusionEnabled', true );
%    m = leaf_setproperty( m, 'flashmovie', false );
%    m = leaf_setproperty( m, 'makemovie', false );
%    m = leaf_setproperty( m, 'moviefile', '' );
%    m = leaf_setproperty( m, 'codec', 'None' );
%    m = leaf_setproperty( m, 'autonamemovie', true );
%    m = leaf_setproperty( m, 'overwritemovie', false );
%    m = leaf_setproperty( m, 'framesize', [] );
%    m = leaf_setproperty( m, 'mov', [] );
%    m = leaf_setproperty( m, 'boingNeeded', false );
%    m = leaf_setproperty( m, 'initialArea', 8832.309971 );
%    m = leaf_setproperty( m, 'bendunitlength', 93.980370 );
%    m = leaf_setproperty( m, 'targetRelArea', 1.000000 );
%    m = leaf_setproperty( m, 'defaultinterp', 'min' );
%    m = leaf_setproperty( m, 'readonly', false );
%    m = leaf_setproperty( m, 'projectdir', 'C:\PhD\Models\Gynoecium\Gynoecium\2014\Capsella\post thesis' );
%    m = leaf_setproperty( m, 'modelname', 'GPT_isotropic growth ealry phase_20140826' );
%    m = leaf_setproperty( m, 'allowsave', true );
%    m = leaf_setproperty( m, 'addedToPath', false );
%    m = leaf_setproperty( m, 'bendsplit', 0.300000 );
%    m = leaf_setproperty( m, 'usepolfreezebc', false );
%    m = leaf_setproperty( m, 'dorsaltop', true );
%    m = leaf_setproperty( m, 'defaultazimuth', -45.000000 );
%    m = leaf_setproperty( m, 'defaultelevation', 33.750000 );
%    m = leaf_setproperty( m, 'defaultroll', 0.000000 );
%    m = leaf_setproperty( m, 'defaultViewParams', (unknown type ''struct'') );
%    m = leaf_setproperty( m, 'comment', '' );
%    m = leaf_setproperty( m, 'legendTemplate', '%T: %q\n%m' );
%    m = leaf_setproperty( m, 'bioAsplitcells', true );
%    m = leaf_setproperty( m, 'bioApullin', 0.142857 );
%    m = leaf_setproperty( m, 'bioAfakepull', 0.202073 );
%    m = leaf_setproperty( m, 'viewrotationstart', -45.000000 );
%    m = leaf_setproperty( m, 'viewrotationperiod', 0.000000 );
%    m = leaf_setproperty( m, 'interactive', false );
%    m = leaf_setproperty( m, 'coderevision', 0 );
%    m = leaf_setproperty( m, 'coderevisiondate', '' );
%    m = leaf_setproperty( m, 'modelrevision', 0 );
%    m = leaf_setproperty( m, 'modelrevisiondate', '' );
%    m = leaf_setproperty( m, 'savedrunname', '' );
%    m = leaf_setproperty( m, 'savedrundesc', '' );
%    m = leaf_setproperty( m, 'vxgrad', (108 values) );
%    m = leaf_setproperty( m, 'lengthscale', 80.000000 );
end

% Here you may write any functions of your own, that you want to call from
% the interaction function, but never need to call from outside it.
% Remember that they do not have access to any variables except those
% that you pass as parameters, and cannot change anything except by
% returning new values as results.
% Whichever section they are called from, they must respect the same
% restrictions on what modifications they are allowed to make to the mesh.

% For example:

% function m = do_something( m )
%   % Change m in some way.
% end

% Call it from the main body of the interaction function like this:
%       m = do_something( m );
