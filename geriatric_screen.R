# 👴 Geriatric Prescribing Cascade Screening Engine
# Based on the 2026 reference guide for polypharmacy in older adults.

detect_prescribing_cascades <- function(medication_list) {
  # Convert all inputs to lowercase to avoid matching errors
  meds <- tolower(medication_list)
  
  cat("\n=== Geriatric Polypharmacy & Cascade Review ===\n")
  cat(sprintf("Total Medications Checked: %d\n", length(medication_list)))
  cat("-----------------------------------------------\n")
  
  # 1. Check for the NSAID Cascade 💊
  has_nsaid <- any(meds %in% c("ibuprofen", "diclofenac", "naproxen"))
  has_antihypertensive <- any(meds %in% c("amlodipine", "lisinopril", "telmisartan"))
  
  if (has_nsaid && has_antihypertensive) {
    cat("⚠️ FLAG: Potential NSAID Prescribing Cascade Detected!\n")
    cat("👉 Clinical Insight: NSAIDs can elevate blood pressure. Ensure the antihypertensive was not added simply to treat NSAID-induced hypertension.\n\n")
  }
  
  # 2. Check for the Cholinesterase Inhibitor Cascade 🧠
  has_achei <- any(meds %in% c("donepezil", "rivastigmine", "galantamine"))
  has_anticholinergic <- any(meds %in% c("oxybutynin", "tolterodine"))
  
  if (has_achei && has_anticholinergic) {
    cat("❌ CRITICAL FLAG: Antagonistic Prescribing Cascade Detected!\n")
    cat("👉 Clinical Insight: Donepezil increases acetylcholine, while Oxybutynin blocks it. These drugs directly cancel each other out and worsen cognitive decline!\n\n")
  }
  
  # Default safety check for polypharmacy
  if (length(medication_list) >= 5) {
    cat("⚠️ NOTE: Patient meets the threshold for Polypharmacy (>= 5 medications). Monitor closely for cumulative drug burden.\n")
  }
}

# --- Test Case Execution ---
# Scenario: An elderly patient taking Donepezil, Atorvastatin, Metformin, and Oxybutynin (4 meds)
current_patient_meds <- c("Donepezil", "Atorvastatin", "Metformin", "Oxybutynin")
detect_prescribing_cascades(current_patient_meds)
