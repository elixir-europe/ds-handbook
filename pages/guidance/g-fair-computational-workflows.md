---
title: Making your computational workflows FAIR
description: How to make computational workflows findable, accessible, interoperable, and reusable — from registration and versioning to provenance capture and archival packaging.
contributors: [Luiz Gadelha]
page_id: g-fair-computational-workflows
type: Guidance

resources:
  - name: "Applying the FAIR Principles to Computational Workflows"
    url: https://doi.org/10.1038/s41597-025-04451-9
    description: The 20 FAIR guidelines for workflows from the WCI FAIR Computational Workflows Working Group (Scientific Data, 2025).
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
  - name: nf-test
    url: https://www.nf-test.com/
    description: Testing framework for Nextflow pipelines.
    category: external_resource
  - name: nf-core/variantbenchmarking
    url: https://nf-co.re/variantbenchmarking
    description: nf-core pipeline for benchmarking variant calling workflows.
    category: external_resource
---

## Context

Computational workflows are simultaneously **software**, something executable, and **data**: a specification of a process. Therefore, curating and managing them are increasingly part of the tasks of data stewards. Dependencies deprecate and containers become unavailable, making more difficuly to reproduce a workflow with time. Even when it still runs, one needs detailed provenance to know whether an output came from the same code, the same version, and the same parameters.

You can apply the FAIR principles to computational workflows: registering the workflow makes it findable, using standard formats for its specification and execution records makes it interoperable, and capturing provenance at run time makes it reusable. In 2025, the FAIR Computational Workflows Working Group (part of the Workflows Community Initiative) published 20 guidelines adapting FAIR to computational workflows (see resources below). This page translates those guidelines into practical actions you can take with existing tools.

{% include callout.html type="note" content="Tool suggestions use Nextflow and nf-core conventions as examples, they automate many of these steps. The underlying principles apply equally to CWL, Snakemake, Galaxy, and other languages." %}

## Guidance

1. **Register your workflow in a searchable registry**

   Deposit the workflow in WorkflowHub or Dockstore (see resources). Both mint persistent identifiers (DOIs) for registered workflows, store metadata, and track versions. A GitHub repository alone is not indexed in a searchable, citable way, registration is what makes your workflow findable to others.

2. **Version-tag each release and associate a DOI**

   Tag each release in version control and register it (step 1) to obtain a version-specific DOI. Different versions of a workflow can produce different results, so collaborators and reviewers need to cite the exact version used. WorkflowHub generates a DOI per tagged release automatically; connecting your GitHub repository to Zenodo achieves the same for simpler cases.

3. **Add standardised metadata**

   Describe your workflow with machine-readable metadata. The Bioschemas ComputationalWorkflow profile or CodeMeta captures title, authors with ORCIDs, workflow specification language, licence, and dependencies. For Nextflow, add this metadata to the `manifest` block in `nextflow.config`.

4. **Licence the workflow and its components**

   Choose a licence for the workflow as a whole, then verify it is compatible with the licences of all its components, tools, sub-workflows, and containers each carry their own. Incompatible licences can restrict how the combined output is shared, and this is easy to overlook when assembling modular pipelines.

5. **Capture provenance at run time**

   Configure your workflow engine to record which input files and parameters were used, which tool versions ran, and what outputs were produced. This is the evidence you need to reproduce any specific execution,  not the workflow alone, but the record of a run on specific inputs. For Nextflow, enable the `nf-prov`  plugin, which records provenance as a Workflow Run RO-Crate or a BioCompute Object, or the data lineage option in in Nextflow configuration.

{% include callout.html type="tip" content="nf-prov and Nextflow lineage capture are not enabled by default, they are opt-in configurations. Build them into your workflow template so new pipelines inherit them from the start." %}

6. **Package the workflow with RO-Crate for archival**

   Bundle your workflow, its metadata, and (where feasible) an example run record into an RO-Crate, a  packaging standard that keeps the workflow readable and citable even when the execution platform is no longer available (see resources). For Nextflow, `nf-core pipelines rocrate` packages the workflow with Bioschemas-compatible metadata that you can then upload to WorkflowHub for registration.

7. **Add automated testing and domain benchmarking**

   Include at least one automated test that verifies the workflow produces correct output from a known input, this documents and protects correctness as the workflow evolves. Optionally, add domain-specific benchmarking to provide evidence of scientific output quality. For example, in Nextflow, `nf-test` covers testing and `nf-core/variantbenchmarking` covers benchmarking in the variant calling domain.
