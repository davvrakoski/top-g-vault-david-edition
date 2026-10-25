100STYLE Dataset - original readme / record text
================================================

The original 100STYLE.zip contains no README file. Its documentation is the
Zenodo record text and the dataset web page, reproduced below, plus the two
metadata files shipped in the zip (Dataset_List.csv and Frame_Cuts.csv, both
copied unchanged into this folder).

Zenodo record 8127870 (https://zenodo.org/records/8127870)
----------------------------------------------------------
Title:        100STYLE Dataset
Creators:     Mason, Ian; Starke, Sebastian; Komura, Taku
Published:    2022-05-04
DOI:          10.1145/3522618
License:      Creative Commons Attribution 4.0 International (cc-by-4.0)
Files:        100STYLE.zip (1,468,515,354 bytes, md5 3cf627852fd8192024c04a8d0ef49583)
              100Style-Labelled-Data.zip (not used here)

Description (verbatim from the record):
  This is the 100STYLE dataset originally presented in the work Real-Time
  Style Modelling of Human Locomotion via Feature-Wise Transformations and
  Local Motion Phases.

  This dataset contains over four million frames of stylized motion capture
  data. Both original bvh motion capture files (100STYLE.zip) and processed
  data (100Style-Labelled-Data.zip) are provided. The data is labelled using
  the hybrid approach to local phases described in the paper alongside the
  extraction of motion features such as joint positions, rotations and
  velocities. InputLabels.txt and OutputLabels.txt describe each of the
  feature dimensions extracted.

Notes from the dataset page (https://www.ianxmason.com/100style/), summarised
-----------------------------------------------------------------------------
- 100 locomotion styles, all performed by the same actor, captured at 60 fps.
- One BVH per style and content type, named <Style>_<Code>.bvh.
- Content codes:
    BR  = backwards running      BW  = backwards walking
    FR  = forwards running       FW  = forwards walking
    ID  = idling                 SR  = sidestep running
    SW  = sidestep walking       TR1/TR2/TR3 = transitions (mixed moves)
- Captures start and end with T-poses and extra frames; Frame_Cuts.csv gives
  the start/stop frame of the usable motion for every file.
- Dataset_List.csv lists every style with a description and whether it is
  stochastic and/or left-right symmetric (useful for mirroring).
- Requested credit for creative/commercial work, e.g. "The 100STYLE Dataset -
  Ian Mason".

Citation (BibTeX, from the dataset page)
----------------------------------------
@article{mason2022local,
  author    = {Mason, Ian and Starke, Sebastian and Komura, Taku},
  title     = {Real-Time Style Modelling of Human Locomotion via Feature-Wise
               Transformations and Local Motion Phases},
  year      = {2022},
  publisher = {Association for Computing Machinery},
  address   = {New York, NY, USA},
  volume    = {5},
  number    = {1},
  doi       = {10.1145/3522618},
  journal   = {Proceedings of the ACM on Computer Graphics and Interactive Techniques},
  month     = {may},
  articleno = {6}
}

What this vault folder contains (the converted version)
-------------------------------------------------------
- <Style>/<Style>_<Code>.fbx : the BVH clip trimmed with Frame_Cuts.csv,
  resampled to 30 fps, converted to FBX (armature + baked animation, metres,
  Y-up / -Z forward, no leaf bones, ~1.79 m tall skeleton, 23 joints with
  root "Hips"). Root motion is kept in the Hips bone.
- <Style>/preview.png : stick-figure render of the forwards-walking clip.
- See LICENSE-CC-BY-4.0.txt for the license, the attribution line and the
  list of changes.
