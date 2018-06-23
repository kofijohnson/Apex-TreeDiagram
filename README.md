# Apex TreeDiagram

This library can be used to display a Tree Diagram in a Visuaforce Page, from Apex. 

## Installing the Apex TreeDiagram

The Apex TreeDiagram can be deployed to your Scratch Org by clicking:

[![Deploy](https://deploy-to-sfdx.com/dist/assets/images/DeployToSFDX.svg)](https://deploy-to-sfdx.com/)

## Example

1. Open the Visualforce Page TreeDiagramPage,
2. Run the Apex script below in a Developer Console, or any Salesforce IDE. Confirm the Tree Diagram is displayed realtime in the TreeDiagramPage.

```apex
// Create the first Node.
TreeDiagramNode node1 = (new TreeDiagramNode('Node-1')).setColor('red');

// Create 2 children Nodes, and add to the first node.
TreeDiagramNode node11 = (new TreeDiagramNode('Node-11')).setColor('blue');
TreeDiagramNode node12 = (new TreeDiagramNode('Node-12')).setColor('blue');
node1.addChild(node11);
node1.addChild(node12);

// Create and add grandchildren nodes.

TreeDiagramNode node111 = new TreeDiagramNode(('Node-111')).setColor('green');
TreeDiagramNode node112 = new TreeDiagramNode(('Node-112')).setColor('green');
node11.addChild(node111);
node11.addChild(node112);

TreeDiagramNode node121 = new TreeDiagramNode(('Node-121')).setColor('green');
node12.addChild(node121);

// Display the Tree Diagram from the first node.
node1.display();
```