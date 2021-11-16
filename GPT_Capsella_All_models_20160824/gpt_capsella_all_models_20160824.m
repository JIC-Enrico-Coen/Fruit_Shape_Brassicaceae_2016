function m = gpt_capsella_all_models_20160824( m )
%m = gpt_capsella_all_models_20160824( m )
%   Morphogen interaction function.
%   Written at 2016-09-05 10:58:19.
%   GFtbox revision 5453, 2016-08-03 16:20.

% The user may edit any part of this function between delimiters
% of the form "USER CODE..." and "END OF USER CODE...".  The
% delimiters themselves must not be moved, edited, deleted, or added.

    if isempty(m), return; end

    fprintf( 1, '%s found in %s\n', mfilename(), which(mfilename()) );

    try
        m = local_setproperties( m );
    catch
    end

    setGlobals();
    realtime = m.globalDynamicProps.currenttime;
    dt = m.globalProps.timestep;

%%% USER CODE: INITIALISATION

% In this section you may modify the mesh in any way whatsoever.
if (Steps(m)==0) && m.globalDynamicProps.doinit % First iteration
    m = leaf_fix_vertex( m, 'vertex', [], 'dfs', '' ); % unfix all vertices from the start.
    m = leaf_plotoptions( m, 'hiresdpi', 300);
    
    % Model types
    m.userdata.ranges.modelname.range{1}= 'MODEL1-E_PHASE_AND_EARLY_M_PHASE';
    m.userdata.ranges.modelname.range{2}= 'MODEL2-E_PHASE_AND_M_PHASE';
    m.userdata.ranges.modelname.range{3}= 'MODEL3-E_PHASE_AND_M_PHASE_AND_L_PHASE';
    
    m.userdata.ranges.modelname.range{4}= 'MODEL5-NESLIA';
    m.userdata.ranges.modelname.range{5}= 'MODEL6-LEPIDIUM';
    
    m.userdata.ranges.modelname.range{6}= 'MODEL8-MUTANT';
    
    % Select Model here
    m.userdata.ranges.modelname.index = 1;
    
    
end
modelname = m.userdata.ranges.modelname.range{m.userdata.ranges.modelname.index};
%%% END OF USER CODE: INITIALISATION

%%% SECTION 1: ACCESSING MORPHOGENS AND TIME.
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.

    polariser_i = FindMorphogenRole( m, 'POLARISER' );
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
    [id_fert_i,id_fert_p,id_fert_a,id_fert_l] = getMgenLevels( m, 'ID_FERT' );
    [s_gprox_i,s_gprox_p,s_gprox_a,s_gprox_l] = getMgenLevels( m, 'S_GPROX' );
    [s_gdist_i,s_gdist_p,s_gdist_a,s_gdist_l] = getMgenLevels( m, 'S_GDIST' );
    [id_apex_i,id_apex_p,id_apex_a,id_apex_l] = getMgenLevels( m, 'ID_APEX' );
    [id_valve_i,id_valve_p,id_valve_a,id_valve_l] = getMgenLevels( m, 'ID_VALVE' );
    [c_growth_i,c_growth] = getCellFactorLevels( m, 'c_growth' );

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
%            POLARISER            5   0.001       ----     ----
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
%              ID_FERT         ----    ----       ----     ----
%              S_GPROX         ----    ----       ----     ----
%              S_GDIST         ----    ----       ----     ----
%              ID_APEX         ----    ----       ----     ----
%             ID_VALVE         ----    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

if (Steps(m)==42) && m.globalDynamicProps.doinit  % Initialisation code.
    m = leaf_makesecondlayer( m, 'mode', 'few', 'numcells', 150, 'relarea', 0.001, ...     %relarea for 0-4 DAI 0.005 and 0.002 for 2.5DAI-8.5DAI
        'allowoveredge', false, 'allowoverlap', false );
    % Must set 'allowoveredge' to false, to avoid non-circular
    % cells at the edge of the mesh.
    % Need to re-establish the variables c_growth_i and c_growth,
    % because we've just changed the second layer.  c_growth is used to
    % store the growth on the major axis.
    [c_growth_i,c_growth] = getCellFactorLevels( m, 'c_growth' );
    
    % Store initial shape data.
    m.userdata.initialcellshapes = cellshapes( m );
    
    % Plot the c_growth cellular factor with rainbow colour-coding.  Use
    % 'posneg' instead of 'rainbow' if you want a colour scale that goes from
    % white to red.
    m = leaf_setcellcolorinfo( m, 'factor', 'c_growth', 'mode', 'rainbow' );
end

if Steps(m) > 42
    k = cellshapes( m );
    cellgrowth = k(:,[1 2]) ./ m.userdata.initialcellshapes(:,[1 2]);
    c_growth(:) = cellgrowth(:,1);
end


if (Steps(m)==0) && m.globalDynamicProps.doinit  % Initialisation code.
    %% PRN Polariser Regulatory Network
    
    proxorg_ind= m.nodes(:,3)<-19.5;
    id_proxorg_p(proxorg_ind) = 1;
    P(proxorg_ind) = 1;
    m = leaf_fix_mgen( m, polariser_i,'vertex',find(proxorg_ind),'fix', 1);
    
    m = leaf_mgen_conductivity(m, polariser_i, 5);
    m = leaf_mgen_absorption(m, polariser_i, 0.001);
    
    id_distorg_p(m.nodes(:,3)>17.5) = 1;
    
    basenodes_ind= min(m.nodes(:,3));
    id_basenodes_p(m.nodes(:,3)==basenodes_ind) =1;
    
    % m.fixedDFmap( id_basenodes_p==1, 3 ) = true;
    m = leaf_fix_vertex( m, 'vertex', id_basenodes_p==1, 'dfs', 'z' );
    
    %% Growth factors
    
    % STYLE
    id_style_p(m.nodes(:,3)>14) = 1;
    
    m.mgen_production(:, s_style_i) = id_style_p;                                                               % whereever id_style is s_rep is produced
    m = leaf_mgen_conductivity(m, s_style_i, 0.25);                                                              % how much s_style is conducted
    m = leaf_mgen_absorption(m, s_style_i, 0);                                                                  % how much s_style is degraded at each node
    m = leaf_mgen_dilution(m, s_style_i, 0);
    
    m.morphogenclamp( id_style_p==1, s_style_i ) = 1;                                                           % Clamping the highest value of s_style to 1.
    s_style_p = 1 * id_style_p;
    
    % BASE
    id_base_p(m.nodes(:,3)<-16) = 1;
    
    m.mgen_production(:, s_base_i) = id_base_p;                                                                 % whereever id_rep is s_rep is produced
    m = leaf_mgen_conductivity(m, s_base_i, 0.25);                                                               % how much s_rep is conducted
    m = leaf_mgen_absorption(m, s_base_i, 0);                                                                   % how much s_rep is degraded at each node
    m = leaf_mgen_dilution(m, s_base_i, 0);
    
    m.morphogenclamp( id_base_p==1, s_base_i ) = 1;                                                             % Clamping the highest value of s_base to 1.
    s_base_p = 1 * id_base_p;
    
    % REP
    id_rep_p((abs(m.nodes(:,1))<10)&(m.nodes(:,3)<14)) = 1;
    
    % SHOULDERS -top half of the model
    id_shoulders_p(m.nodes(:,3)>0) = 1;
    
    % MIDVALVE
    id_midvalve_p((abs(m.nodes(:,2))<7.5)&(m.nodes(:,3)<14)) = 1;
    
    % VALVE
    id_valve_p= 1- (id_midvalve_p+id_rep_p+id_style_p);
    
    %APEX
    id_apex_p((abs(m.nodes(:,2))<7.5)&(m.nodes(:,3)<8)&(m.nodes(:,3)>2)) = 1;
    
    % INHIBITMV- linear gradient highest at the base
    % (fixed to 1) and lowest in the shoulders (fixed to 0)
    m.mgen_production(:, s_inhibitmv_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_inhibitmv_i,15);                                                            % factor used to set up gdist
    m = leaf_mgen_absorption(m, s_inhibitmv_i, 0);
    m = leaf_mgen_dilution(m, s_inhibitmv_i, 0);
    
    m.morphogenclamp(((id_base_p==1)|(id_shoulders_p>0)), s_inhibitmv_i ) = 1;                                  % Clamping the highest value of s_inhibitmv to 1 and in the shoulders to 0 to make a linear gradient.
    s_inhibitmv_p = 1 * id_base_p;
    
    
    % GPROX- linear gradient in the valves fixed as 1 at the base and 0 in the shoulders
    m.mgen_production(:, s_gprox_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_gprox_i,15);                                                                % to create gradient in the distal end of valves
    m = leaf_mgen_absorption(m, s_gprox_i, 0);
    m = leaf_mgen_dilution(m, s_gprox_i, 0);
    
    m.morphogenclamp(((id_base_p==1)|(id_shoulders_p>0)|(id_midvalve_p>0)), s_gprox_i ) = 1;                    % Clamping the highest value of s_gprox to 1 and in the shoulders to 0 to make a linear gradient.
    s_gprox_p = 1 * id_base_p;
    
    
    % GDIST- Linear gradient fixed as 1 in the distal region(below
    % the style) and fixed to 0 at the base.
    
    id_gdist_p((m.nodes(:,3)>5)&(m.nodes(:,3)<14)&(abs(m.nodes(:,2))>7.5)&(m.nodes(:,3)<14)) = 1;               % id_gdist in upper half of valve, not in midvalve- because in KRN would promote extra growth in midvalve on top of gmidvalve
    
    m.mgen_production(:, s_gdist_i) = id_gdist_p;
    m = leaf_mgen_conductivity(m, s_gdist_i,5);                                                                 % factor used to inhibit kpar at top
    m = leaf_mgen_absorption(m, s_gdist_i, 0);
    m = leaf_mgen_dilution(m, s_gdist_i, 0);
    
    m.morphogenclamp(((id_gdist_p==1)|(id_base_p>0)|(id_style_p>0)), s_gdist_i ) = 1;
    s_gdist_p = 1 * id_gdist_p;
    
    %                 m.morphogenclamp(((id_gdist_p==1)|(id_base_p>0)|(id_midvalve_p>0)|(id_style_p>0)), s_gdist_i ) = 1;         % Clamping the highest value of s_gdist to 1 and at Base 0 to make a linear gradient
    %                 s_gdist_p = 1 * id_gdist_p;
    
end

if Steps(m)==3
    
    % STYLE
    
    m.mgen_production(:, s_style_i) = id_style_p;
    m = leaf_mgen_conductivity(m, s_style_i, 0);                                                                % stop conductivity, fixing valves of s_style
    m = leaf_mgen_absorption(m, s_style_i, 0);
    m = leaf_mgen_dilution(m, s_style_i, 0);
    
    % BASE
    
    m.mgen_production(:, s_base_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_base_i, 0);                                                                 % stop conductivity, clamping values of s_base
    m = leaf_mgen_absorption(m, s_base_i, 0);
    m = leaf_mgen_dilution(m, s_base_i, 0);
    
end

if Steps(m)==6
    
    % GPROX - fix the gradient
    m.mgen_production(:, s_gprox_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_gprox_i, 0);
    m = leaf_mgen_absorption(m, s_gprox_i, 0);
    m = leaf_mgen_dilution(m, s_gprox_i, 0);
    
    
    % GDIST- fix the gradient
    
    m.mgen_production(:, s_gdist_i) = id_gdist_p;
    m = leaf_mgen_conductivity(m, s_gdist_i,0);
    m = leaf_mgen_absorption(m, s_gdist_i, 0);
    m = leaf_mgen_dilution(m, s_gdist_i, 0);
    
    % INHIBITMV - fix the gradient
    m.mgen_production(:, s_inhibitmv_i) = id_base_p;
    m = leaf_mgen_conductivity(m, s_inhibitmv_i,0);
    m = leaf_mgen_absorption(m, s_inhibitmv_i, 0);
    m = leaf_mgen_dilution(m, s_inhibitmv_i, 0);
    
    % GMIDVALVE - linear gradient in the midvalve opposite to
    % s_inhibitmv_p
    
    id_gmidvalve_p= (1 - s_inhibitmv_p - s_style_p) .*id_midvalve_p ;                                               % gradient in the midvalve, 0 in style, highest in distal end of midvalve
    
    
    
end

if realtime>=0
    
    % EPHASE- early phase from 0-2DAI wjere growth in length is high
    
    id_ephase_p(abs(m.nodes(:,3))>0) = 1;
    
end

if realtime >=48
    
    % EPHASE
    
    id_ephase_p(abs(m.nodes(:,3))>0) = 0;
    
    % MPHASE- middle phase to generate the snuff bottle phase where
    % growth in width increases
    
    id_mphase_p(abs(m.nodes(:,3))>0) = 1;
    
    
    
end


if realtime >= 208
    
    % MPHASE
    
    id_mphase_p(abs(m.nodes(:,3))>0) = 0;
    
    % LPHASE- late phase where a heart-shpae form is generated from the
    % snuff bottle and alternative gradients affect Kper and Kpar
    
    id_lphase_p(abs(m.nodes(:,3))>0) = 1;
    
    
    
end

if realtime >=0

    switch modelname
        case 'MODEL1-E_PHASE_AND_EARLY_M_PHASE'
            kapar_p(:) = 0.012 .* pro(2,id_ephase_p)...
                .*inh(5,id_base_p.*id_mphase_p);
            
            kbpar_p(:) = kapar_p;
            
            kaper_p(:) = 0.012.* inh(5,s_style_p.*id_mphase_p)...
                .*inh(1,s_base_p.*id_mphase_p);
            
            kbper_p(:) = kaper_p;
            
            knor_p(:) = 0.01;
            
            if realtime >= 96 % this model ends a 96h therefore stops growing
                kapar_p(:) = 0;
                kbpar_p(:) = 0;
                kaper_p(:) = 0;
                kbper_p(:) = 0;
                knor_p(:) = 0;
            end
            
            
        case 'MODEL2-E_PHASE_AND_M_PHASE'
            kapar_p(:) = 0.012 .* pro(2,id_ephase_p)...
                .*inh(5,id_base_p.*id_mphase_p)...
                .*pro(0.2,id_midvalve_p.*id_mphase_p);
            
            kbpar_p(:) = kapar_p;
            
            kaper_p(:) = 0.012.* inh(5,s_style_p.*id_mphase_p)...
                .*inh(1,s_base_p.*id_mphase_p)...
                .*inh(5,id_rep_p.*id_mphase_p)...
                .*inh(1,id_midvalve_p.*id_mphase_p);
            
            kbper_p(:) = kaper_p;
            
            knor_p(:) = 0.01;
            
            if realtime >= 204 % this model ends a 204h therefore stops growing
                kapar_p(:) = 0;
                kbpar_p(:) = 0;
                kaper_p(:) = 0;
                kbper_p(:) = 0;
                knor_p(:) = 0;
            end
            
        case 'MODEL3-E_PHASE_AND_M_PHASE_AND_L_PHASE'
            kapar_p(:) = 0.012.*pro(2,id_ephase_p)...
                .*inh(5,id_base_p.*id_mphase_p)...
                .*pro(0.2,id_midvalve_p.*id_mphase_p)...
                .*inh(100,id_base_p.*id_lphase_p)...
                .*inh(0.5,s_style_p.*id_lphase_p)...
                .*pro(0.4,id_gmidvalve_p.*id_lphase_p .* inh(100,id_apex_p))...                 
                .*inh(4,s_gdist_p.*id_lphase_p .* inh(100,id_midvalve_p .* inh(100,id_apex_p)))...
                .*pro(2,s_gprox_p.*id_lphase_p);
            
            kbpar_p(:) = kapar_p;
            
            kaper_p(:) = 0.012.*inh(1,s_base_p.*id_mphase_p)...
                .*inh(5,s_style_p.*id_mphase_p)...
                .*inh(5,id_rep_p.*id_mphase_p)...
                .*inh(1,id_midvalve_p.*id_mphase_p)...
                .*inh(2,s_gprox_p.*id_lphase_p)....
                .*inh(1,s_base_p.*id_lphase_p)...
                .*inh(2,s_style_p.*id_lphase_p)...
                .*inh(5,id_rep_p.*id_lphase_p)...
                .*inh(1,id_midvalve_p.*id_lphase_p);                                         
            
            kbper_p(:) = kaper_p;
            
            knor_p(:) = 0.01;
            
        case 'MODEL5-NESLIA'
            kapar_p(:) = 0.012.*pro(2,id_ephase_p)...
               .*inh(5,id_base_p.*id_mphase_p)...
               .*inh(100,id_base_p.*id_lphase_p);
            
            kbpar_p(:) = kapar_p;
            
            kaper_p(:) = 0.012.*inh(1,s_base_p.*id_mphase_p)...
                .*inh(5,s_style_p.*id_mphase_p)...
                .*inh(5,id_rep_p.*id_mphase_p)...
                .*inh(1,s_base_p.*id_lphase_p)...
                .*inh(2,s_style_p.*id_lphase_p)...
                .*inh(5,id_rep_p.*id_lphase_p);
            
            kbper_p(:) = kaper_p;
            
            knor_p(:) = 0.01;
            
        case 'MODEL6-LEPIDIUM'
            kapar_p(:) = 0.012.*pro(2,id_ephase_p)...
                .*inh(5,id_base_p.*id_mphase_p)...
                .*pro(0.2,id_midvalve_p.*id_mphase_p)...
                .*inh(100,id_base_p.*id_lphase_p)...
                .*inh(0.5,s_style_p.*id_lphase_p)...
                .*pro(0.4,id_gmidvalve_p.*id_lphase_p);                                                                       
            
            kbpar_p(:) = kapar_p;
            
            kaper_p(:) = 0.012.*inh(1,s_base_p.*id_mphase_p)...
                .*inh(5,s_style_p.*id_mphase_p)...
                .*inh(5,id_rep_p.*id_mphase_p)...
                .*inh(1,id_midvalve_p.*id_mphase_p)...
                .*inh(1,s_base_p.*id_lphase_p)...
                .*inh(2,s_style_p.*id_lphase_p)...
                .*inh(5,id_rep_p.*id_lphase_p)...
                .*inh(1,id_midvalve_p.*id_lphase_p);  
            
            kbper_p(:) = kaper_p;
            
            knor_p(:) = 0.01;            
                        
        case 'MODEL8-MUTANT'
            kapar_p(:) = 0.012.*pro(2,id_ephase_p)...
                .*inh(5,id_base_p.*id_mphase_p)...
                .*pro(0.2,id_midvalve_p.*id_mphase_p)...
                .*pro(0.4,id_gmidvalve_p.*id_lphase_p .* inh(100,id_apex_p))...                                             %.*inh(1,id_gmidvalve_p)...
                .*inh(100,id_base_p.*id_lphase_p)...
                .*inh(0,s_gdist_p.*id_lphase_p .* inh(100,id_midvalve_p .* inh(100,id_apex_p)))...
                .*pro(2,s_gprox_p.*id_lphase_p)...
                .*inh(0.5,s_style_p.*id_lphase_p)...
                .*inh(1,id_lphase_p);
            
            kbpar_p(:) = kapar_p;
            
            kaper_p(:) = 0.012.*inh(1,s_base_p.*id_mphase_p)...
                .*inh(5,s_style_p.*id_mphase_p)...
                .*inh(5,id_rep_p.*id_mphase_p)...
                .*inh(1,id_midvalve_p.*id_mphase_p)...
                .*inh(2,s_gprox_p.*id_lphase_p)....
                .*inh(1,s_base_p.*id_lphase_p)...
                .*inh(2,s_style_p.*id_lphase_p)...
                .*inh(5,id_rep_p.*id_lphase_p)...
                .*inh(1,id_midvalve_p.*id_lphase_p)...
                .*inh(1,id_lphase_p);
            
            kbper_p(:) = kaper_p;
            
            knor_p(:) = 0.01;                   
            
    end
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
    m.morphogens(:,id_fert_i) = id_fert_p;
    m.morphogens(:,s_gprox_i) = s_gprox_p;
    m.morphogens(:,s_gdist_i) = s_gdist_p;
    m.morphogens(:,id_apex_i) = id_apex_p;
    m.morphogens(:,id_valve_i) = id_valve_p;
    m.secondlayer.cellvalues(:,c_growth_i) = c_growth(:);

%%% USER CODE: FINALISATION

if realtime == 160
    m = leaf_subdivide( m, 'morphogen','id_midvalve',...
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
function [eigvecs,eigvalues] = fitEllipsoid( pts ) %[eigvecs,eigvalues] = fitEllipsoid( pts )
%   Find the best-fit ellipsoid to a set of points.
%   PTS is an N*D array of N points in D-dimensional space.
%   The result will be a D*D matrix of eigenvectors and a 1*D matrix of
%   eigenvalues.

numpts = size(pts,1);
avpt = sum(pts,1)/numpts;
pts = pts - repmat( avpt,numpts,1);

[eigvecs,eigvalues] = eig( (pts'*pts)/numpts );
eigvalues = diag(eigvalues);
[eigvalues,p] = sort(eigvalues,'descend');
eigvecs = eigvecs(:,p);
eigvalues = reshape(eigvalues,1,[]);
end


function k = cellshapes( m )
%k = cellshapes( m )
% Calculate a measure of the shape of each biological cell of m.
%   The result is an N*3 array giving three values in descending order for
%   each cell. These are relative measures of the length of the cell's
%   major axis, the length of its minor axis, and its thickness (which
%   should be close to zero and the smallest of the three).

numcells = length(m.secondlayer.cells);
k = zeros(numcells,3);
for i=1:numcells
    pts = m.secondlayer.cell3dcoords( m.secondlayer.cells(i).vxs, : );
    [~,k(i,:)] = fitEllipsoid( pts );
end
k = 2 * sqrt(abs(k));
end

