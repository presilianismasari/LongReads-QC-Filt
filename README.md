# 🧬 LongReads QC

This repository provides a Nextflow pipeline for quality control and assembly of long-read sequencing data using **Filtlong** and **NanoPlot**. It includes Dockerfiles for reproducible execution, so users do not need to install the tools manually.

---
## Requirements
- [Nextflow](https://www.nextflow.io/)
- [Docker](https://www.docker.com/) (for containerized execution)

> **Note:** You do not need to install Filtlong or NanoPlot manually; the pipeline uses the Docker containers provided in this repo.

---
## 🐳 Docker Setup

**Build Docker images**:
```bash
docker build --no-cache -t nanoplot:latest -f docker/Dockerfile.nanoplot .
docker build --no-cache -t filtlong:latest -f docker/Dockerfile.filtlong .
```

---
## 🚀Run the Nextflow pipeline:
```bash
nextflow run main.nf --filtlong_target_bases 5000000
```

Pipeline Parameters
--filtlong_target_bases : Target bases for Filtlong filtering (adjust as needed)
--filtlong_keep_percentage : Percentage of reads to keep (default: 90)
--filtlong_min_length : Minimum read length for filtering (default: 1000)
