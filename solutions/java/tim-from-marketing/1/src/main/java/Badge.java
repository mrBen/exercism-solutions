class Badge {
    public String print(Integer id, String name, String department) {
        StringBuilder label = new StringBuilder();

        if (id != null)
            label.append(String.format("[%d] - ", id));

        label.append(name)
                .append(" - ")
                .append(department != null ? department.toUpperCase() : "OWNER");

        return label.toString();
    }
}
