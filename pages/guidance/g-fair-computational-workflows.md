---
# ============================================================================
# Signpost (Guidance) template
# Copy this file to pages/guidance/g-<shortname>.md and fill it in.
# Fields marked (mandatory) are required. Everything else is optional.
# Write in line with the DS Handbook Style Guide (About > Style guide).
# ============================================================================

title: Making computational workflows FAIR                 # mandatory – short, not a full sentence, specific; align with file name
layout: guidance                       # mandatory – leave as-is
type: Guidance                     # mandatory – leave as-is
search_exclude: true               # leave as-is
contributors: [Luiz Gadelha]          # mandatory – comma separated list, names must match _data/CONTRIBUTORS.yaml; add missing names in your Pull Request; yaml file is located under data > sidebars > file CONTRIBUTORS
page_id: g-fair-computational-workflows             # mandatory – lowercase, hyphenated, same as the file name

# ---------------------------------------------------------------------------
# At a glance box – three tabs at the top of the page. Easiest to write last.
# ---------------------------------------------------------------------------

# Tab 1: At a glance
description: How to make computational workflows FAIR, from registration and versioning to provenance capture and archival.        # mandatory – one sentence (10–20 words) on the core outcome of the page; also used in search results
last update: 2026-11-11          # mandatory – date of the last substantial change or review (ISO 8601), not typo fixes
topics:                            # mandatory – 3–5 short keywords for readers and search engines
  - computational workflows                      
  - FAIR principles
  - provenance
  - workflow registries
  - RO-Crate

# Tab 2: Introduced skills
skills:                            # mandatory – 3–5 skills; use the exact label from ESCO or add the URI as a comment
  - manage findable accessible interoperable and reusable data  # http://data.europa.eu/esco/skill/4f5c1208-62fd-4e5a-a51e-306c06947e11
  - manage research data    # http://data.europa.eu/esco/skill/08b04e53-ed25-41a2-9f90-0b9cd939ba3d
  - tools for software configuration management   # http://data.europa.eu/esco/skill/9d2e926f-53d9-41f5-98f3-19dfaa687f3f

# Tab 3: Takeaways
takeaways:                         # mandatory – 2–3 short bullets with the main message of the page; write these last
  - A workflow is both software and data. Register it in WorkflowHub or Dockstore and issue a DOI for every release of it so that the exact version can be cited.
  - Re-running workflows does not prove reproducibility. Enable provenance recording (e.g. nf-prov, Nextflow lineage) so each run records its inputs, parameters, tool versions, and outputs.
  - For long-term preservation, package the workflow, its metadata, and an example run record as an RO-Crate.


resources:
  - name: "Applying the FAIR Principles to Computational Workflows"
    url: https://doi.org/10.1038/s41597-025-04451-9
    description: FAIR guidelines for workflows from the WCI FAIR Computational Workflows Working Group (Scientific Data, 2025).
    category: external_resource
  - name: WorkflowHub
    url: https://workflowhub.eu/
    description: FAIR workflow registry supporting DOI minting, RO-Crate packaging, Bioschemas metadata, and versioning.
    category: external_resource
  - name: Dockstore
    url: https://dockstore.org/
    description: Open workflow registry widely used in genomics; supports CWL, WDL, Nextflow, and Galaxy.
    category: external_resource
  - name: RO-Crate
    url: https://www.researchobject.org/ro-crate/
    description: Lightweight packaging standard for bundling a workflow with its metadata and provenance records.
    category: external_resource
  - name: RO-Crate Workflow Run profile
    url: https://www.researchobject.org/workflow-run-crate/
    description: Profile for packaging the record of a specific workflow execution alongside the workflow.
    category: external_resource
  - name: nf-prov (Nextflow)
    url: https://github.com/nextflow-io/nf-prov
    description: Nextflow plugin that captures run-level provenance and emits a Workflow Run RO-Crate or BioCompute Object.
    category: external_resource
  - name: Getting started with data lineage
    url: https://docs.seqera.io/nextflow/tutorials/data-lineage
    description: Data lineage in Nextflow provides tracking of workflow runs, task executions, and output files.
    category: external_resource
  - name: Bioschemas ComputationalWorkflow profile
    url: https://bioschemas.org/profiles/ComputationalWorkflow/1.0-RELEASE
    description: Structured metadata schema for describing computational workflows in a machine-readable way.
    category: external_resource
---

Computational workflows are simultaneously **software**, something executable, and **data**, a specification of a process. Curating and managing them are increasingly part of your task as data steward. Dependencies become deprecated and containers become unavailable, making it more difficult to reproduce a workflow with time. Even when it still runs, you need detailed provenance to know whether an output came from the same code, the same version, and the same parameters.

In 2025, the FAIR Computational Workflows Working Group (part of the Workflows Community Initiative) published guidelines adapting FAIR to computational workflows (see resources below). This page translates those guidelines into practical activities you can perform with existing tools. The activities follow a workflow's life cycle, but you can apply each on its own. Tool tips use Nextflow, but the principles also apply also CWL, Snakemake, Galaxy, and other workflow engines.


## Make sure each workflow is registered in a searchable registry

When you curate a workflow, check that it is deposited in WorkflowHub or Dockstore (see resources), and help the authors register it if it is not. 

### Don't rely on a GitHub repository alone

A GitHub repository alone is not indexed in a searchable, citable way, registration is what makes the workflow findable to others.

### Use a DOI issued by the registry

Both registries mint persistent identifiers (DOIs) for registered workflows, store metadata, and track versions.  

### Set up an institutional space in WorkflowHub

If your institution or project has many workflows, consider setting up an institutional or project space in WorkflowHub so they are grouped and easy to find.

## Check that releases are versioned and cited with a version-specific DOI

Confirm that each release is tagged in version control and registered (see previous section), so that every version has its own DOI. Different versions of a workflow can produce different results, so collaborators and reviewers need to cite the exact version used. 

### Issue a DOI for each release

In WorkflowHub, a DOI can be generated per tagged release; connecting a GitHub repository to Zenodo achieves the same for simpler cases.

## Review and complete the workflow metadata

Check that the workflow is described with machine-readable metadata, and fill gaps with the authors. 

### Use metadata standards

The Bioschemas ComputationalWorkflow profile or CodeMeta captures title, authors with ORCIDs, workflow specification language, licence, and dependencies. 

### Fill in the Nextflow `manifest` block

For Nextflow, this metadata is recorded in the `manifest` block in `nextflow.config`.

## Check the licence of the workflow and its components

Make sure the workflow as a whole has a licence, then verify it is compatible with the licences of all its components, tools, sub-workflows, and containers each carry their own. 

### Check for incompatible licences

Incompatible licences can restrict how the combined output is shared. This is easy to overlook when assembling modular workflows.

## Record runs, not just the workflow specification

Check whether the workflow engine was configured to record which input files and parameters were used, which tool versions ran, and what outputs were produced. 

### Support reproducibility

Provenance is the evidence you need to reproduce a specific execution, not the workflow specification alone, but the record of a run on specific inputs. 

### Enable `nf-prov` or Nextflow lineage in your workflow

For Nextflow, enable the `nf-prov` plugin, which records provenance as a Workflow Run RO-Crate or a BioCompute Object, or the data lineage option in the Nextflow configuration. `nf-prov` and Nextflow lineage capture are not enabled by default, they are opt-in configurations. Build them into your workflow template so new pipelines inherit them from the start.

## Archive the workflow as an RO-Crate

For long-term preservation, make sure the workflow, its metadata, and (when feasible) an example run are packaged into an RO-Crate, a packaging standard that keeps the workflow readable and citable even when the execution platform is no longer available (see resources). 

### Package Nextflow workflows into RO-Crates

For Nextflow, `nf-core pipelines rocrate` packages the workflow with Bioschemas-compatible metadata that can then be uploaded to WorkflowHub for registration.
