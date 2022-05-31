

-- Foreign architecture targeted for ModelSim
architecture behav of IM is
    attribute foreign : string;
    attribute foreign of behav : architecture is "init_func ./compiled_view.sl";
begin
end behav;
