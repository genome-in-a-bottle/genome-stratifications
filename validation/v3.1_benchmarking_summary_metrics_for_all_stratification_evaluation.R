##########################################
## This script is to summarize metrics from the hap.py results_extended.csv
## and outputs metrics for all stratitications in stratification .tsv provided
###########################################

library(tidyverse)
library(fs)
library(here)
## Variable inputs for script, run separately

## CHM13
data <- here("CHM13v2.0")
tsv <- here("CHM13v2.0/v3.1-CHM13v2.0-all-stratifications.tsv")
ref <- "CHM13v2.0"
genome <- "HG002"
bench <- "HPRC-CHM13v2.0-DB"
csv <- "CHM13v2.0-summary-stats.csv"

## GRCh38
data <- here("GRCh38")
tsv <- here("GRCh38/v3.1-GRCh38-all-stratifications.tsv")
ref <- "GRCh38"
genome <- "HG002"
bench <- "HPRC-GRCh38-DB"
csv <- "GRCh38-summary-stats.csv"

## GRCh37
data <- here("GRCh37")
tsv <- here("GRCh37/v3.1-GRCh37-all-stratifications.tsv")
ref <- "GRCh37"
genome <- "HG002"
bench <- "HPRC-GRCh37-DB"
csv <- "GRCh37-summary-stats.csv"

############################################
## Function to read in  metrics
############################################

read_ext_results <- function(dir) {
  extended_files <- fs::dir_ls(dir, regexp = "extended.csv$")
  ext_results <- extended_files %>%  set_names() %>% map_dfr(read_csv, .id="source") %>%
    filter(Filter == "PASS", Subtype %in% c("*", "I16_PLUS", "D16_PLUS"))  %>%
    select(c(source,
             Filter,
             Type,
             Subtype,
             Subset,
             METRIC.Recall,
             METRIC.Precision,
             METRIC.Frac_NA,
             Subset.Size,
             Subset.IS_CONF.Size,
             TRUTH.TOTAL,
             TRUTH.TP,
             TRUTH.TP.het,
             TRUTH.TP.homalt,
             TRUTH.FN,
             TRUTH.FN.het,
             TRUTH.FN.homalt,
             TRUTH.TOTAL.het_hom_ratio,
             QUERY.TOTAL,
             QUERY.FP,
             QUERY.FP.het,
             QUERY.FP.homalt,
             QUERY.TOTAL.het_hom_ratio,
             FP.gt,
             FP.al)) %>%
    rename(Query = source,
           Recall = METRIC.Recall,
           Precision = METRIC.Precision,
           Frac_NA = METRIC.Frac_NA)
  ext_results$Query <- str_split(ext_results$Query, "/") %>% sapply(tail,1)
  ext_results$Query <- str_split(ext_results$Query, "_") %>% sapply("[", 2 )
  return(ext_results)
}

extended_results <- read_ext_results(data)

############################################
## Create list of stratifcation to subset to for summary
############################################
stratifications_tsv <- read.csv(tsv, header = FALSE, sep ="\t")
stratifications_vector <- pull(stratifications_tsv, V1)
print(stratifications_vector)

if (ref == "GRCh38"){
  subsets <- stratifications_vector
} else {
  subsets <- stratifications_vector
}

print(subsets)

############################################
## Filter the orginal data frame for Type (SNP/INDEL) and desired stratifications (Subset). Rename colnames to note
## metric Type in larger table once combined.
############################################
## genrally the function does the following
##    1) subset to desired stratifications and subtype = "*"
##    2) rename colnames to specify Type for the metric (e.g. SNP or INDEL)
##    3) combine metric types into single table where all Type.metric cols are present.
##    4) Add additional columns for subtypes I16 and D16 (insertions and deletions 16+ bp in length) for specific
##       metrics for the same subsets (stratifications) as prior columns
##    5) combines all subtables into single output table (4 rows x 16 cols)
##    6) 8/4 added additional metrics and new calculated metrics to explore ancestry strat stats
############################################

type_rename <- function(combined_results) {
  # create subtable for SNPs and INDELs with Subtype = *
  SNP_ext_results<- combined_results %>%
    filter(Type == "SNP" & Subset %in% subsets & Subtype == "*") %>%
    rename( SNP.Recall = Recall,
            SNP.Precision = Precision,
            SNP.Frac_NA = Frac_NA,
            SNP.TRUTH.TOTAL.het_hom_ratio = TRUTH.TOTAL.het_hom_ratio,
            SNP.TRUTH.TP = TRUTH.TP,
            SNP.TRUTH.TP.het = TRUTH.TP.het,
            SNP.TRUTH.TP.homalt = TRUTH.TP.homalt,
            SNP.TRUTH.FN = TRUTH.FN,
            SNP.TRUTH.FN.het = TRUTH.FN.het,
            SNP.TRUTH.FN.homalt = TRUTH.FN.homalt,
            SNP.QUERY.TOTAL.het_hom_ratio = QUERY.TOTAL.het_hom_ratio,
            SNP.QUERY.FP = QUERY.FP,
            SNP.QUERY.FP.het = QUERY.FP.het,
            SNP.QUERY.FP.homalt = QUERY.FP.homalt,
            SNP.FP.gt = FP.gt,
            SNP.FP.al = FP.al,
            SNP.TRUTH.TOTAL = TRUTH.TOTAL,
            SNP.QUERY.TOTAL = QUERY.TOTAL,
            SNP.Subset.IS_CONF.Size = Subset.IS_CONF.Size,
            SNP.Subset.Size = Subset.Size) %>% 
    mutate("SNP.Truth/kb" = (as.numeric(SNP.TRUTH.TOTAL)/as.numeric(SNP.Subset.IS_CONF.Size))*1000) %>%
    mutate("SNP.Query/kb" = (as.numeric(SNP.QUERY.TOTAL)/as.numeric(SNP.Subset.Size))*1000) %>%
    select(-Type,-Subtype, -Filter, -SNP.TRUTH.TOTAL, -SNP.QUERY.TOTAL, -SNP.Subset.IS_CONF.Size, -SNP.Subset.Size)
  
  INDEL_ext_results <- combined_results %>%
    filter(Type == "INDEL" & Subset %in% subsets & Subtype == "*") %>%
    rename(INDEL.Recall = Recall,
           INDEL.Precision = Precision,
           INDEL.Frac_NA = Frac_NA,
           INDEL.TRUTH.TOTAL.het_hom_ratio = TRUTH.TOTAL.het_hom_ratio,
           INDEL.TRUTH.TP = TRUTH.TP,
           INDEL.TRUTH.TP.het = TRUTH.TP.het,
           INDEL.TRUTH.TP.homalt = TRUTH.TP.homalt,
           INDEL.TRUTH.FN = TRUTH.FN,
           INDEL.TRUTH.FN.het = TRUTH.FN.het,
           INDEL.TRUTH.FN.homalt = TRUTH.FN.homalt,
           INDEL.QUERY.TOTAL.het_hom_ratio = QUERY.TOTAL.het_hom_ratio,
           INDEL.QUERY.FP = QUERY.FP,
           INDEL.QUERY.FP.het = QUERY.FP.het,
           INDEL.QUERY.FP.homalt = QUERY.FP.homalt,
           INDEL.FP.gt = FP.gt,
           INDEL.FP.al = FP.al,
           INDEL.TRUTH.TOTAL = TRUTH.TOTAL,
           INDEL.QUERY.TOTAL = QUERY.TOTAL,
           INDEL.Subset.IS_CONF.Size = Subset.IS_CONF.Size,
           INDEL.Subset.Size = Subset.Size) %>% 
    mutate("INDEL.Truth/kb" = (as.numeric(INDEL.TRUTH.TOTAL)/as.numeric(INDEL.Subset.IS_CONF.Size))*1000) %>%
    mutate("INDEL.Query/kb" = (as.numeric(INDEL.QUERY.TOTAL)/as.numeric(INDEL.Subset.Size))*1000) %>%
    select(-Type,-Subtype, -Filter, -INDEL.TRUTH.TOTAL, -INDEL.QUERY.TOTAL, -INDEL.Subset.IS_CONF.Size, -INDEL.Subset.Size)

  # join subtables for SNPs and INDELs where Subtype = *
  star_join <- left_join(INDEL_ext_results,
                         SNP_ext_results,
                         by = c("Query", "Subset"))

  # create subtables for insertions and deletions 16+ bp in length
  ext_results_I16_ext_results <- combined_results %>%
    filter(Type == "INDEL"& Subset %in% subsets & Subtype == "I16_PLUS") %>%
    rename(I16_PLUS.Recall = Recall,
           I16_PLUS.Precision = Precision,
           I16_PLUS.TP = TRUTH.TP,
           I16_PLUS.FP = QUERY.FP,
           I16_PLUS.FN = TRUTH.FN) %>%
    select(Query, Subset, I16_PLUS.Recall,I16_PLUS.Precision,I16_PLUS.TP, I16_PLUS.FP, I16_PLUS.FN)

  ext_results_D16_ext_results <- combined_results %>%
    filter(Type == "INDEL"& Subset %in% subsets & Subtype == "D16_PLUS") %>%
    rename(D16_PLUS.Recall = Recall,
           D16_PLUS.Precision = Precision,
           D16_PLUS.TP = TRUTH.TP,
           D16_PLUS.FP = QUERY.FP,
           D16_PLUS.FN = TRUTH.FN) %>%
    select(Query, Subset, D16_PLUS.Recall, D16_PLUS.Precision, D16_PLUS.TP, D16_PLUS.FP, D16_PLUS.FN)

  # join subtables where insertions and deletions 16+ bp in length
  plus_join <- left_join(ext_results_I16_ext_results,
                         ext_results_D16_ext_results,
                         by = c("Query", "Subset"))

  # output table created by joining metrics for Subtype = * and 16+bp
  ext_results_combined_renamed <-left_join(star_join,
                                           plus_join,
                                           by = c("Query" , "Subset")) %>%
      mutate(Genome=genome) %>%
      select(Query,Genome, everything())%>%
      mutate(Ref=ref)%>%
      select(Query, Genome, Ref, everything())%>%
      mutate(benchmark=bench)%>%
      select(Query, Genome, Ref, benchmark, everything())

return(ext_results_combined_renamed)
}

ext_results_combined_renamed <- type_rename(extended_results)

write.csv(ext_results_combined_renamed, csv)
