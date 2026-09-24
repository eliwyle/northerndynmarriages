---
permalink: /networks/
title: "Networks"
author_profile: false
toc: false
---
*Marriage is the successful joining of two families, a match joining different clans; from service to a ruling house's ancestral shrine to the continuation of a family to its next generation...marriage precedes the relation between father and son or ruler and subject as the bulwark of ceremony and propriety, loyalty and filiality!*

— Excerpt from the 492 CE edict of Northern Wei Emperor Xiaowen (*Wei shu* 21A.534–535)

---
<p>The networks on this site were created with the use of Gephi. They model the marriage networks of the Northern Dynasties elite, built from a database of over nine thousand individuals.</p>

---
# Sixteen Kingdoms marital networks
<p>Interactive network of ruling families of the Sixteen Kingdoms (304-439 CE). Marital connections include endogamous (green), diplomatic (purple), ruler-subject (blue), and conquest (red). Use the mouse to zoom, pan, and hover over nodes. </p>
<div
  id="16k-network"
  class="sigma-container"
  style="width: 100%; height: 800px; border: 1px solid #ddd;"></div>

---
# Northern and Southern Dynasties complete marital networks
<p>Interactive network of Northern and Southern Dynasties marriages. Use the mouse to zoom, pan, and hover over nodes.</p>
<div 
  id="complete-network" 
  class="sigma-container"
  style="width: 100%; height: 800px; border: 1px solid #ddd;"></div>

 ----

# Non-imperial marriage networks of Northern Dynasties elite families
 <p>Interactive network of Northern Dynasties marriages. Use the mouse to zoom, pan, and hover over nodes.</p>
 
  <div 
    id="non-imperial-network" 
    class="sigma-container"
    style="width: 100%; height: 800px; border: 1px solid #ddd;"></div>
<script type="module">
  import Graph from "https://cdn.jsdelivr.net/npm/graphology@0.25.4/+esm";
  import GEXF from "https://cdn.jsdelivr.net/npm/graphology-gexf@0.13.2/+esm";
  import Sigma from "https://cdn.jsdelivr.net/npm/sigma@3.0.2/+esm";

  async function loadNetwork(containerId, graphPath) {
    const container = document.getElementById(containerId);

    try {
      const url = "{{ '/files/' | relative_url }}" + graphPath;
      const response = await fetch(url);

      if (!response.ok) {
        throw new Error(`Could not load graph (${response.status})`);
      }

      const xml = await response.text();
      const graph = GEXF.parse(Graph, xml);

      new Sigma(graph, container);
    } catch (error) {
      container.innerHTML = `
        <p style="color: #b00; padding: 1em;">
          Error loading graph: ${error.message}
        </p>
      `;
    }
  }
  
  loadNetwork(
    "16k-network",
    "network-02ba4355-b8a.gexf"
    );

  loadNetwork(
    "complete-network",
    "network-2835ae9d-602.gexf"
  );


  loadNetwork(
    "non-imperial-network",
    "network-f60c0f46-9d8.gexf"
  );
</script>



