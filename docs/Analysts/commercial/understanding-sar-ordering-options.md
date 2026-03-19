# **Understanding SAR Ordering Options**

The ordering options required when purchasing **Airbus SAR (TerraSAR‑X / TanDEM‑X)** commercial data in the EODH interface vary slightly from those required for purchasing optical commercial data. Below we outline the additional required fields, and describe each of the options listed in the dropdown menu.

---

## **Product Bundle**
This indicates the processing level of the SAR imagery, and contains different options than for optical data.

<div style="float:right; margin-left:15px;">
    <img width="200" height="200" alt="image" src="https://github.com/user-attachments/assets/4f511a44-ad57-49ab-87f7-b15bfff10a54" />
</div>
### **Single Look Slant Range Complex (SSC)**  
SSC products contain **“complex values (amplitude + phase)”** and are delivered in **“slant‑range geometry”**, suitable for interferometry and coherence analysis.

<div style="float:right; margin-left:15px;">
  <img width="200" height="200" alt="image" src="https://github.com/user-attachments/assets/1ae7930f-45bd-4000-9a6a-5aebb022bc3b" />
</div>
### **Multi‑Look Ground Detected (MGD)**  
MGD products are **“multi‑looked, ground‑range detected imagery”**, reducing speckle and enhancing radiometric quality. Phase information is removed, making them suitable for general radar interpretation.

<div style="float:right; margin-left:15px;">
    <img width="200" height="200" alt="image" src="https://github.com/user-attachments/assets/3199f112-1fb3-4b9c-8d5e-22fb7b2e09ff" style="float:right; margin-left:15px;"/>
</div>
### **Geocoded Ellipsoid Corrected (GEC)**  
GEC products are **“ellipsoid‑corrected”** and geocoded, providing improved spatial accuracy and compatibility with GIS mapping workflows.

<div style="float:right; margin-left:15px;">
    <img width="200" height="200" alt="image" src="https://github.com/user-attachments/assets/505ca658-ce98-4fba-ba1c-346f8de8bb4a" style="float:right; margin-left:15px;"/>
</div>
### **Enhanced Ellipsoid Corrected (EEC)**  
EEC products are **“enhanced ellipsoid‑corrected”** imagery with additional geometric and radiometric refinements beyond GEC, suitable for precision mapping and change detection.

---

## **Resolution Variant (Resolution Mode)**

TerraSAR‑X offers two resolution mode variants for detected products. Because TerraSAR‑X range resolution is close to or better than azimuth resolution, looks cannot be derived by degrading azimuth resolution. Two variants are therefore available: one optimised for **resolution** and one for **radiometry**, both using **square ground resolution cells**.

### **Spatially Enhanced (SE)**  
Designed for the **highest possible square ground resolution**. Depending on imaging mode, polarisation, and incidence angle, the larger of the azimuth or ground‑range resolution values determines the square pixel size. The smaller value is adjusted to match this size, and the bandwidth reduction is used for **speckle reduction**.  

!!! note
    ❌ **Not available for the two ScanSAR modes.**

### **Radiometrically Enhanced (RE)**  
Optimised for **radiometry**. Range and azimuth resolution are deliberately reduced, allowing **5 to 7 looks** to be averaged. This significantly reduces speckle and provides a **radiometric resolution of about 1.5 dB**.

---

## **Projection**

Projection options determine the spatial reference system applied to the delivered SAR product. The standard cartographic projections for TerraSAR‑X Basic and Enhanced Image Products are Universal Transversal Mercator (UTM) and Uniform Polar Stereographic (UPS) with WGS84 ellipsoid. Projection of the delivered product can be easily converted in most GIS systems later.

- **Auto** — Automatically selects UTM or UPS based on scene latitude.  
- **UTM** — Universal Transverse Mercator (WGS84).  
- **UPS** — Uniform Polar Stereographic (WGS84), used for extreme latitudes.

---

!!! note
    **Resolution Variant and Projection are not applicable for ordering SAR data under the SSC product bundle.**  
    SSC products use complex slant‑range data (amplitude + phase), not Earth‑projected coordinate systems or multi‑look spatial resolutions.

---

## **Orbit**

Positional accuracies depend (among other things) on the precision of the orbit measurement. Two orbit precisions are available for Airbus SAR ordered via the EODH.

### **Rapid Orbit**  
3D RMS accuracy of **2 m** for general SAR image generation.

### **Science Orbit**  
3D RMS accuracy of **10 cm**, suitable for high‑precision SAR interferometry and scientific analysis.

!!! note
    🔭 **When to choose Science Orbit?** Choose the Science Orbit when your application requires centimetre‑level geometric precision, particularly for interferometric SAR (InSAR), deformation mapping, or scientific workflows requiring the highest possible orbit accuracy. We recommend using science orbit for InSAR applications. Products with this option include the most precise understanding of the sensor’s orbital position and speed, which translates into more geometrically precise interferograms.

---
