/*******************************************************************************************************
* @descripton Representation of a Node in the Tree Diagram.
* @Author: Kofi Johnson - https://github.com/kofijohnson
********************************************************************************************************/
public virtual class TreeDiagramNode {
    private String name;
    private String color;
    private transient TreeDiagramNode parent;
    private List<TreeDiagramNode> children;

    private String tooltipTitle;
    private String tooltipDetails;

    /*******************************************************************************************************
    * @description Node Constructor.
    * @param String. The name of the Node.
    ********************************************************************************************************/
    public TreeDiagramNode(String name) {
        this.name = name;
        this.color = 'white';
        this.children = new List<TreeDiagramNode>();

        this.tooltipTitle = '';
        this.tooltipDetails = '';
    }

    /*******************************************************************************************************
    * @description Gets the Name of the Node.
    * @return String. Name of the Node.
    ********************************************************************************************************/
    public String getName() {
        return this.name;
    }

    /*******************************************************************************************************
    * @description Sets the Node parent.
    * @param TreeDiagramNode. The parent of the Node.
    * @return TreeDiagramNode
    ********************************************************************************************************/
    public TreeDiagramNode setParent(TreeDiagramNode parentNode) {
        this.parent = parentNode;

        return this;
    }

    /*******************************************************************************************************
    * @description Gets the Parent of the Node.
    * @return TreeDiagramNode. Parent of the Node.
    ********************************************************************************************************/
    public TreeDiagramNode getParent() {
        return this.parent;
    }

    /*******************************************************************************************************
    * @description Sets the color of the Node.
    * @param String. The Color of the Node.
    * @return TreeDiagramNode.
    ********************************************************************************************************/
    public TreeDiagramNode setColor(String color) {
        this.color = color;

        return this;
    }

    /*******************************************************************************************************
    * @description Sets ToolTip title.
    * @param String. The title of the TootTip.
    * @return TreeDiagramNode.
    ********************************************************************************************************/
    public TreeDiagramNode setToolTipTitle(String title) {
        this.tooltipTitle = title;

        return this;
    }

    /*******************************************************************************************************
    * @description Adds a line to the ToolTip.
    * @param String. The line content.
    * @return TreeDiagramNode
    ********************************************************************************************************/
    public TreeDiagramNode addToolTipDetails(String details) {
        this.tooltipDetails = details;

        return this;
    }

    /*******************************************************************************************************
    * @description Adds a child Node.
    * @param TreeDiagramNode. Child Node.
    * @return void.
    ********************************************************************************************************/
    public void addChild(TreeDiagramNode childNode) {
        childNode.setParent(this);
        children.add(childNode);
    }

    /*******************************************************************************************************
    * @description Gets the number of Children.
    * @return Integer.
    ********************************************************************************************************/
    public Integer children() {
        return children.size();
    }

    /*******************************************************************************************************
    * @description Displays the Node on the TreeDiagramPage.
    * @return void.
    ********************************************************************************************************/
    public void display() {
        TreeDiagram__e microTriggerReport = new TreeDiagram__e(
            Content__c = JSON.serialize(this)
        );
        Database.SaveResult result = EventBus.publish(microTriggerReport);
    }
}