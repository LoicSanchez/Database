-- ************  PART 1   *************
-- Run this after restoring the DB

/* Script to clean tables before importing new DB*/
-- Basic V6 upgrades SQL queries
TRUNCATE TABLE environment_object;
TRUNCATE TABLE permanent_table;
TRUNCATE TABLE attribute_relation;
TRUNCATE TABLE attribute_cache;
TRUNCATE TABLE attribute_widget_style;
TRUNCATE TABLE new_attribute;
--TRUNCATE TABLE user_Attribute;
TRUNCATE TABLE formatting_rule;
TRUNCATE TABLE formatting_ruleset;
TRUNCATE TABLE style;
TRUNCATE TABLE table_Style;
TRUNCATE TABLE formula_cache;
TRUNCATE TABLE persistent_cache;
TRUNCATE TABLE user_parameter;
TRUNCATE TABLE transaction_log;
TRUNCATE TABLE ppm2_transaction;
TRUNCATE TABLE dump_optimizer;

-- Additional tables to clean
TRUNCATE TABLE ppm2__adm_pt_data_class;
TRUNCATE TABLE ppm2__sc_pt_reporting;
TRUNCATE TABLE ppm2__gui_pt_modules;
TRUNCATE TABLE document;

TRUNCATE TABLE ppm2__ihm_tb_pt_model;
TRUNCATE TABLE ppm2__ihm_tb_pt_tool_model_nn;
TRUNCATE TABLE ppm2__ihm_tb_pt_tools;
TRUNCATE TABLE ppm2__atv_pt_att_val;

TRUNCATE TABLE ppm2__l1_pt_sf;
TRUNCATE TABLE ppm2__lo_pt_lo;
TRUNCATE TABLE ppm2__al_pt_al;
TRUNCATE TABLE ppm2__ba_pt_batch;
TRUNCATE TABLE ppm2__ba_pt_batch_details;

--TRUNCATE TABLE ppm2__gs_pt_global_user_file;

TRUNCATE TABLE ppm2__fmb_pt_custom_reports;
TRUNCATE TABLE ppm2__ntf_pt_notif_category;
TRUNCATE TABLE ppm2__ntf_pt_notification;

TRUNCATE TABLE ppm2__ind_pt_indicator;
TRUNCATE TABLE ppm2__ind_pt_parameters;
TRUNCATE TABLE ppm2__ind_pt_indicator_value;
TRUNCATE TABLE ppm2__ind_pt_rule;
TRUNCATE TABLE ppm2__ind_pt_user_parameter;
TRUNCATE TABLE ppm2__bar_pt_indic_bar;

TRUNCATE TABLE ppm2__pe_pt_equa_equatemp;
TRUNCATE TABLE ppm2__PE_PT_EQUA_EQUATION;
TRUNCATE TABLE ppm2__pe_pt_equa_eqactatt;
TRUNCATE TABLE ppm2__pe_pt_equa_filteratt;
TRUNCATE TABLE ppm2__pe_pt_equa_eqfilatt;
TRUNCATE TABLE ppm2__pe_pt_equa_actionatt;

TRUNCATE TABLE ppm2__FF_PT_FAVOR_FILTERS;

DELETE FROM globalsettings WHERE name LIKE '%_FILE';
DELETE FROM globalsettings WHERE name LIKE 'XXXX_GS_%';
DELETE FROM globalsettings WHERE name = '_XML_SET_S_HISTORY_DATASET';
/* end of the script*/

/* Script to update file names*/
UPDATE common_dataset SET name = 'YYY_COMMON_DATA' WHERE name = 'XXXX_COMMON_DATA';
UPDATE common_dataset SET ppm2_comment = 'Customer common data' WHERE name = 'YYY_COMMON_DATA';
UPDATE common_dataset SET name = 'YYY_COMMON_FILE' WHERE name = 'XXXXLION_COMMON_FILE';
UPDATE common_dataset SET ppm2_comment = 'Customer common file' WHERE name = 'YYY_COMMON_FILE';
/* end of the script*/

/* Script to rename calendars*/
UPDATE calendar SET name = '5D-CAL' WHERE name = '5-DAY STANDARD';
UPDATE calendar SET name = '7D-CAL' WHERE name = '7-DAY STANDARD';
UPDATE calendar SET name = 'IDCH-CAL' WHERE name = 'ATLN';
UPDATE calendar SET name = 'IDUS-CAL' WHERE name = 'ATLN COMBO';
/* end of the script*/

/* Script to update profile names*/
UPDATE user_group SET name = 'YYY_G_RM_PLUS' WHERE name = 'XXXX_RM_PLUS';
UPDATE user_group SET name = 'YYY_P_PMO' WHERE name = 'XXXX_PM_PLUS';
UPDATE user_group SET name = 'YYY_P_TC' WHERE name = 'XXXX_TC';
UPDATE user_group SET name = 'YYY_P_PM' WHERE name = 'XXXX_PM';
UPDATE user_group SET name = 'YYY_P_RM' WHERE name = 'XXXX_RM';
UPDATE user_group SET name = 'YYY_P_ADM' WHERE name = 'XXXX_ADM';

DELETE FROM user_group WHERE name = 'XXXX_GEN';
DELETE FROM user_group WHERE name = 'XXXX_PORT';
DELETE FROM user_group WHERE name = 'RTS_ADM';
DELETE FROM user_group WHERE name = 'XXXX_RTS_ADM';
DELETE FROM user_group WHERE name = 'XXXX_PEX';

DELETE FROM user_group WHERE name = 'AA';
DELETE FROM user_group WHERE name = 'XXXXLION_USER';
DELETE FROM user_group WHERE name = 'CCMM';
DELETE FROM user_group WHERE name = 'DC';
DELETE FROM user_group WHERE name = 'DMPK PM';
DELETE FROM user_group WHERE name = 'GEN';
DELETE FROM user_group WHERE name = 'MGMT';
DELETE FROM user_group WHERE name = 'PRECLIN_MGMT';
DELETE FROM user_group WHERE name = 'PRECLIN_VIEWALL';
DELETE FROM user_group WHERE name = 'PRES';
DELETE FROM user_group WHERE name = 'REP_WIZ';
DELETE FROM user_group WHERE name = 'RM_PM';
DELETE FROM user_group WHERE name = 'SMGMT';
DELETE FROM user_group WHERE name = 'TOX_ADM';
DELETE FROM user_group WHERE name = 'TOX_PM';
DELETE FROM user_group WHERE name = 'TOX_VIEW';

UPDATE user_group SET name = 'YYY_G_GDS' WHERE name = 'GDS_ISORSIA_USER';
UPDATE user_group SET name = 'YYY_G_PRECLIN' WHERE name = 'PRECLIN';
UPDATE user_group SET name = 'YYY_G_PRECLIN_PM' WHERE name = 'PRECLIN_PM';

UPDATE user_group SET template_user = NULL WHERE name = 'YYY_G_RM_PLUS';
UPDATE user_group SET ppm2__prf_aa_b_profile = NULL WHERE name = 'YYY_G_RM_PLUS';
UPDATE user_group SET template_user = 'PMO_TEMPLATE_USER' WHERE name = 'YYY_P_PMO';
UPDATE user_group SET template_user = 'TC_TEMPLATE_USER' WHERE name = 'YYY_P_TC';
UPDATE user_group SET template_user = 'PM_TEMPLATE_USER' WHERE name = 'YYY_P_PM';
UPDATE user_group SET template_user = 'RM_TEMPLATE_USER' WHERE name = 'YYY_P_RM';
UPDATE user_group SET template_user = 'ADM_TEMPLATE_USER' WHERE name = 'YYY_P_ADM';

UPDATE ppm2_user SET ppm2_comment = 'Template for profile ADM' WHERE name = 'XXXX_ADM_TEMPLATE_USER';
UPDATE ppm2_user SET ppm2_comment = 'Template for profile PMO' WHERE name = 'XXXX_PM_PLUS_TEMPLATE_USER';
UPDATE ppm2_user SET ppm2_comment = 'Template for profile PM' WHERE name = 'XXXX_PM_TEMPLATE_USER';
UPDATE ppm2_user SET ppm2_comment = 'Template for profile RM' WHERE name = 'XXXX_RM_TEMPLATE_USER';
UPDATE ppm2_user SET ppm2_comment = 'Template for profile TC' WHERE name = 'XXXX_TC_TEMPLATE_USER';

UPDATE ppm2_user SET name = 'ADM_TEMPLATE_USER' WHERE name = 'XXXX_ADM_TEMPLATE_USER';
UPDATE ppm2_user SET name = 'PEX_TEMPLATE_USER' WHERE name = 'XXXX_PEX_TEMPLATE_USER';
UPDATE ppm2_user SET name = 'PMO_TEMPLATE_USER' WHERE name = 'XXXX_PM_PLUS_TEMPLATE_USER';
UPDATE ppm2_user SET name = 'PM_TEMPLATE_USER' WHERE name = 'XXXX_PM_TEMPLATE_USER';
UPDATE ppm2_user SET name = 'RM_TEMPLATE_USER' WHERE name = 'XXXX_RM_TEMPLATE_USER';
UPDATE ppm2_user SET name = 'TC_TEMPLATE_USER' WHERE name = 'XXXX_TC_TEMPLATE_USER';

DELETE FROM ppm2_user WHERE name = 'XXXX_GEN_TEMPLATE_USER';
DELETE FROM ppm2_user WHERE name = 'XXXX_PEX_TEMPLATE_USER';
DELETE FROM ppm2_user WHERE name = 'XXXX_PORT_TEMPLATE_USER';
DELETE FROM ppm2_user WHERE name = 'XXXX_RTS_ADM_TEMPLATE_USER';
DELETE FROM ppm2_user WHERE name = 'RTS_ADM_TEMPLATE_USER';
DELETE FROM ppm2_user WHERE name = 'XXXX_RM_PLUS_TEMPLATE_USER';

ALTER TABLE ppm2_user DROP COLUMN XXXX_aa_b_tc_email;

UPDATE user_in_group SET DATASET = -DATASET WHERE onb in (SELECT t1.onb FROM user_in_group t1 LEFT OUTER JOIN user_group t2 ON t1.user_group = t2.onb WHERE t2.onb is null and t1.user_group is not null and t1.user_group <> 0 and t1.dataset > 0) AND DATASET >0;

--UPDATE role_assigned SET ppm2_role = ppm2_role ||',YYY_G_RM_PLUS' where ppm2_role = 'RES_MANAGER';
/* end of the script*/


/* SQL script changing technical names of tables */
-- change table names
ALTER TABLE XXXX_PT_PROJECT_TYPE RENAME TO YYY_PT_PROJECT_TYPE;
ALTER TABLE XXXX_PT_REP_LABELS RENAME TO YYY_PT_REP_LABELS;
ALTER TABLE XXXX_PT_STATUS_CODE RENAME TO YYY_PT_STATUS_CODE;
ALTER TABLE XXXX_PT_SPONSOR RENAME TO YYY_PT_SPONSOR;
/* end of the script*/

/* Script to drop all unwanted tables at the end */
DROP TABLE IF EXISTS XXXX_pt_act_dept_mapper;
DROP TABLE IF EXISTS XXXX_pt_XXXX_resp;
DROP TABLE IF EXISTS XXXX_pt_add_comp_tested;
DROP TABLE IF EXISTS XXXX_pt_cd_dept_mapper;
DROP TABLE IF EXISTS XXXX_pt_country_map;
DROP TABLE IF EXISTS XXXX_pt_cro;
DROP TABLE IF EXISTS XXXX_pt_delayed_approval;
DROP TABLE IF EXISTS XXXX_pt_deleted_activity;
DROP TABLE IF EXISTS XXXX_pt_discipline;
DROP TABLE IF EXISTS XXXX_pt_dmpk_sn;
DROP TABLE IF EXISTS XXXX_pt_dmpk_study_num;
DROP TABLE IF EXISTS XXXX_pt_employee_type;
DROP TABLE IF EXISTS XXXX_pt_fin_code;
DROP TABLE IF EXISTS XXXX_pt_gal_batch;
DROP TABLE IF EXISTS XXXX_pt_glp_status;
DROP TABLE IF EXISTS XXXX_pt_iso2_code;
DROP TABLE IF EXISTS XXXX_pt_kpi_metrics;
DROP TABLE IF EXISTS XXXX_pt_ncrts;
DROP TABLE IF EXISTS XXXX_pt_prj_classif;
DROP TABLE IF EXISTS XXXX_pt_proj_comments;
DROP TABLE IF EXISTS XXXX_pt_personnel;
DROP TABLE IF EXISTS acttrials_code;
DROP TABLE IF EXISTS acttrials_milestone;
DROP TABLE IF EXISTS acttrials_milestone_inst;
DROP TABLE IF EXISTS acttrials_site;
DROP TABLE IF EXISTS acttrials_site_contact;
DROP TABLE IF EXISTS acttrials_trial;
DROP TABLE IF EXISTS acttrials_trial_country;
DROP TABLE IF EXISTS acttrials_trial_site;
DROP TABLE IF EXISTS XXXX_pt_tc_comments;
DROP TABLE IF EXISTS XXXX_pt_subject_group;
DROP TABLE IF EXISTS XXXX_pt_type_of_control;
DROP TABLE IF EXISTS XXXX_pt_type_of_study;
DROP TABLE IF EXISTS XXXX_pt_report_status;
DROP TABLE IF EXISTS XXXX_pt_therapeutic_area;
DROP TABLE IF EXISTS t_p5_actreport_values;
/* end of the script*/

/* Script to delete unwanted files at the end */
/*
DELETE FROM common_dataset WHERE name ='XXXX_MOD_REPORT_V6';
DELETE FROM common_dataset WHERE name ='XXXX_COMMON_DATA_DPE';
DELETE FROM common_dataset WHERE name ='XXXX_COMMON_DATA_P5';
DELETE FROM common_dataset WHERE name ='XXXX_MOD_DATAMODEL';
DELETE FROM common_dataset WHERE name ='XXXX_MOD_INFRASTRUCTURE';
DELETE FROM common_dataset WHERE name ='XXXX_MOD_INFRASTRUCTURE_BTR';
DELETE FROM common_dataset WHERE name ='XXXX_MOD_INFRASTRUCTURE_JSC';
DELETE FROM common_dataset WHERE name ='XXXX_MOD_INFRASTRUCTURE_MGO';
DELETE FROM common_dataset WHERE name ='XXXX_MOD_INFRASTRUCTURE_RBU';
DELETE FROM common_dataset WHERE name ='XXXX_MOD_SCRIPT';
DELETE FROM common_dataset WHERE name ='OOB_CUSTOM_ATTR_PROP';
DELETE FROM common_dataset WHERE name ='OOB_CUSTOM_FILTER';
DELETE FROM common_dataset WHERE name ='OOB_CUSTOM_INSERT_LIBRARY';
DELETE FROM common_dataset WHERE name ='OOB_CUSTOM_NAVI';
DELETE FROM common_dataset WHERE name ='OOB_CUSTOM_REP';
DELETE FROM common_dataset WHERE name ='OOB_CUSTOM_SUB_CRITICAL_PATH';
DELETE FROM common_dataset WHERE name ='OOB_MOD_CUSTOM';
DELETE FROM common_dataset WHERE name ='MOD_DRIVERS';
DELETE FROM common_dataset WHERE name ='MOD_PHARMA_CLIN';

DELETE FROM common_dataset WHERE name ='ENVIRONMENT_COLLECTIONS';
DELETE FROM common_dataset WHERE name ='ENVIRONMENT_DOC';

DELETE FROM common_dataset WHERE name ='_MOD_UTILS_MIGRATION';
DELETE FROM common_dataset WHERE name ='_MOD_RCM';
DELETE FROM common_dataset WHERE name ='_MOD_INFRA_PHARMA';
DELETE FROM common_dataset WHERE name ='_MOD_INFRA_NPD';
DELETE FROM common_dataset WHERE name ='_MOD_BM2';
DELETE FROM common_dataset WHERE name ='SHAREPOINT';
DELETE FROM common_dataset WHERE name ='SETTINGS_FILE';
DELETE FROM common_dataset WHERE name ='BATCHS';

delete from user_dataset_use where not exists (select 1 from common_dataset where onb=provider);
*/
/* end of the script*/

/* SQL script changing technical names of additional and relation attributes*/
-- change relation attribute names
ALTER TABLE ordo_project RENAME COLUMN XXXX_RA_PROJECT_TYPE TO YYY_RA_PROJECT_TYPE;
ALTER TABLE network RENAME COLUMN XXXX_RA_STATUS_CODE TO YYY_RA_STATUS_CODE; 
ALTER TABLE task RENAME COLUMN XXXX_RA_STATUS_CODE TO YYY_RA_STATUS_CODE;
ALTER TABLE network RENAME COLUMN XXXX_RA_SPONSOR TO YYY_RA_SPONSOR; 
ALTER TABLE task RENAME COLUMN XXXX_RA_SPONSOR TO YYY_RA_SPONSOR;
ALTER TABLE network RENAME COLUMN XXXX_RA_DMPK_LAB TO YYY_RA_DMPK_LAB; 
ALTER TABLE task RENAME COLUMN XXXX_RA_DMPK_LAB TO YYY_RA_DMPK_LAB;
ALTER TABLE network RENAME COLUMN XXXX_RA_DMPK_RESP TO YYY_RA_DMPK_RESP; 
ALTER TABLE task RENAME COLUMN XXXX_RA_DMPK_RESP TO YYY_RA_DMPK_RESP;

--change additional attribute names
ALTER TABLE ordo_project RENAME COLUMN XXXX_AA_S_COST_CENTER TO YYY_AA_S_COST_CENTER;
ALTER TABLE network RENAME COLUMN XXXX_AA_S_PROTOCOL_NO TO YYY_AA_S_PROTOCOL_NO; 
ALTER TABLE task RENAME COLUMN XXXX_AA_S_PROTOCOL_NO TO YYY_AA_S_PROTOCOL_NO;
ALTER TABLE network RENAME COLUMN XXXX_AA_S_ACRONYM TO YYY_AA_S_ACRONYM; 
ALTER TABLE task RENAME COLUMN XXXX_AA_S_ACRONYM TO YYY_AA_S_ACRONYM;
ALTER TABLE network RENAME COLUMN XXXX_AA_S_FULL_TITLE TO YYY_AA_S_FULL_TITLE; 
ALTER TABLE task RENAME COLUMN XXXX_AA_S_FULL_TITLE TO YYY_AA_S_FULL_TITLE;
ALTER TABLE network RENAME COLUMN XXXX_AA_S_STUDY_DESIGN TO YYY_AA_S_STUDY_DESIGN; 
ALTER TABLE task RENAME COLUMN XXXX_AA_S_STUDY_DESIGN TO YYY_AA_S_STUDY_DESIGN;
ALTER TABLE network RENAME COLUMN XXXX_AA_S_EUDRA_CT_NO TO YYY_AA_S_EUDRA_CT_NO; 
ALTER TABLE task RENAME COLUMN XXXX_AA_S_EUDRA_CT_NO TO YYY_AA_S_EUDRA_CT_NO;
ALTER TABLE network RENAME COLUMN XXXX_AA_N_SUBJ_PLANNED_PROTO TO YYY_AA_N_SUBJ_PLANNED_PROTO; 
ALTER TABLE task RENAME COLUMN XXXX_AA_N_SUBJ_PLANNED_PROTO TO YYY_AA_N_SUBJ_PLANNED_PROTO;
ALTER TABLE network RENAME COLUMN XXXX_AA_N_SUBJ_ACTUAL_CADP TO YYY_AA_N_SUBJ_ACTUAL_CADP; 
ALTER TABLE task RENAME COLUMN XXXX_AA_N_SUBJ_ACTUAL_CADP TO YYY_AA_N_SUBJ_ACTUAL_CADP;
ALTER TABLE network RENAME COLUMN XXXX_AA_T_PORTFOLIO_COMMENT TO YYY_AA_T_PORTFOLIO_COMMENT; 
ALTER TABLE task RENAME COLUMN XXXX_AA_T_PORTFOLIO_COMMENT TO YYY_AA_T_PORTFOLIO_COMMENT;
ALTER TABLE YYY_PT_PROJECT_TYPE RENAME COLUMN XXXX_AA_S_PERM_ID TO YYY_AA_S_PERM_ID;
/* end of the script*/

-- ************  END OF PART 1   *************

-- ************  PART 2   *************

/* SQL script for migrating L2 attributes to L1 */
CREATE OR REPLACE FUNCTION onb_generator(OUT result numeric(20)) AS $$
DECLARE
	seq_id numeric(20);

BEGIN
	UPDATE ppm2_sequence SET seq_value=((CEILING(seq_value/100)+2)*100)+30 WHERE seq_name='ppm2_seq';
	SELECT seq_value FROM ppm2_sequence WHERE seq_name='ppm2_seq' INTO seq_id;
    result:= seq_id;
END;
$$ LANGUAGE plpgsql;

--RING level 2 attribute to RING level 1 
-- YYY_RING_ACT_REPORT_LABEL
INSERT INTO onb_user_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_RING_ACT_REPORT_LABEL', t1.XXXX_ra_act_rep, t1.XXXX_ra_rep_act, t1.dataset, onb_generator()
	FROM XXXX_pt_act_rep_n_n t1;
DROP TABLE IF EXISTS XXXX_pt_act_rep_n_n;
-- level 2 attribute to level 1
-- COST_CENTER
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_COST_CENTER', t1.ONB, t1.YYY_AA_S_COST_CENTER, t1.ONB, onb_generator()
	FROM ordo_project t1
	WHERE t1.YYY_AA_S_COST_CENTER IS NOT NULL ;
-- PROTOCOL_NO
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_PROTOCOL_NO', t1.ONB, t1.YYY_AA_S_PROTOCOL_NO, t1.dataset, onb_generator()
	FROM network t1
	WHERE t1.YYY_AA_S_PROTOCOL_NO IS NOT NULL ;
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_PROTOCOL_NO', t1.ONB, t1.YYY_AA_S_PROTOCOL_NO, t1.dataset, onb_generator()
	FROM task t1
	WHERE t1.YYY_AA_S_PROTOCOL_NO IS NOT NULL ;
-- ACRONYM
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_ACRONYM', t1.ONB, t1.YYY_AA_S_ACRONYM, t1.dataset, onb_generator()
	FROM network t1
	WHERE t1.YYY_AA_S_ACRONYM IS NOT NULL ;
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_ACRONYM', t1.ONB, t1.YYY_AA_S_ACRONYM, t1.dataset, onb_generator()
	FROM task t1
	WHERE t1.YYY_AA_S_ACRONYM IS NOT NULL ;
-- FULL_TITLE
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_FULL_TITLE', t1.ONB, t1.YYY_AA_S_FULL_TITLE, t1.dataset, onb_generator()
	FROM network t1
	WHERE t1.YYY_AA_S_FULL_TITLE IS NOT NULL ;
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_FULL_TITLE', t1.ONB, t1.YYY_AA_S_FULL_TITLE, t1.dataset, onb_generator()
	FROM task t1
	WHERE t1.YYY_AA_S_FULL_TITLE IS NOT NULL ;
-- STUDY_DESIGN
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_STUDY_DESIGN', t1.ONB, t1.YYY_AA_S_STUDY_DESIGN, t1.dataset, onb_generator()
	FROM network t1
	WHERE t1.YYY_AA_S_STUDY_DESIGN IS NOT NULL ;
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_STUDY_DESIGN', t1.ONB, t1.YYY_AA_S_STUDY_DESIGN, t1.dataset, onb_generator()
	FROM task t1
	WHERE t1.YYY_AA_S_STUDY_DESIGN IS NOT NULL ;
-- YYY_AA_S_EUDRA_CT_NO
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_EUDRA_CT_NO', t1.ONB, t1.YYY_AA_S_EUDRA_CT_NO, t1.dataset, onb_generator()
	FROM network t1
	WHERE t1.YYY_AA_S_EUDRA_CT_NO IS NOT NULL ;
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_S_EUDRA_CT_NO', t1.ONB, t1.YYY_AA_S_EUDRA_CT_NO, t1.dataset, onb_generator()
	FROM task t1
	WHERE t1.YYY_AA_S_EUDRA_CT_NO IS NOT NULL ;
-- YYY_AA_T_PORTFOLIO_COMMENT
UPDATE ordo_rte_element SET attribute = 'USER_ATTRIBUTE_YYY_AA_T_PORTFOLIO_COMMENT' WHERE attribute = 'XXXX_AA_T_PORTFOLIO_COMMENT';

INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_T_PORTFOLIO_COMMENT', t1.ONB, t1.YYY_AA_T_PORTFOLIO_COMMENT, t1.dataset, onb_generator()
	FROM network t1
	WHERE t1.YYY_AA_T_PORTFOLIO_COMMENT IS NOT NULL ;
INSERT INTO suser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_T_PORTFOLIO_COMMENT', t1.ONB, t1.YYY_AA_T_PORTFOLIO_COMMENT, t1.dataset, onb_generator()
	FROM task t1
	WHERE t1.YYY_AA_T_PORTFOLIO_COMMENT IS NOT NULL ;
-- YYY_AA_N_SUBJ_PLANNED_PROTO
INSERT INTO nuser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_N_SUBJ_PLANNED_PROTO', t1.ONB, t1.YYY_AA_N_SUBJ_PLANNED_PROTO, t1.dataset, onb_generator()
	FROM network t1
	WHERE t1.YYY_AA_N_SUBJ_PLANNED_PROTO <> 0;
INSERT INTO nuser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_N_SUBJ_PLANNED_PROTO', t1.ONB, t1.YYY_AA_N_SUBJ_PLANNED_PROTO, t1.dataset, onb_generator()
	FROM task t1
	WHERE t1.YYY_AA_N_SUBJ_PLANNED_PROTO <> 0;
-- YYY_AA_N_SUBJ_ACTUAL_CADP
INSERT INTO nuser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_N_SUBJ_ACTUAL_CADP', t1.ONB, t1.YYY_AA_N_SUBJ_ACTUAL_CADP, t1.dataset, onb_generator()
	FROM network t1
	WHERE t1.YYY_AA_N_SUBJ_ACTUAL_CADP <> 0;
INSERT INTO nuser_value (attname, object_reference, ppm2_value, dataset, onb)
	SELECT 'YYY_AA_N_SUBJ_ACTUAL_CADP', t1.ONB, t1.YYY_AA_N_SUBJ_ACTUAL_CADP, t1.dataset, onb_generator()
	FROM task t1
	WHERE t1.YYY_AA_N_SUBJ_ACTUAL_CADP <> 0;
/* end of the script*/

-- ************  END OF PART 2  *************

